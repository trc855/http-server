require 'socket'
require 'test/unit'

class ServerTest < Test::Unit::TestCase
  def test_http_customer_42
    server = TCPSocket.open('localhost', 80)

    user_id = 'test'
    request = "GET /customers/#{user_id} HTTP/1.1\r\n\r\n"
    server.puts(request)

    response = ''

    while line = server.gets
      response += line
    end

    body = IO.read('example.html')
    body.gsub!('{{user_id}}', user_id)
    status = 200

    assert_equal "HTTP/1.1 #{status}\r\nContent-Type: text/html\r\n\r\n#{body}", response

    server.close
  end
end
