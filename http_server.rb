require 'socket'
require_relative 'server_errors'

socket = TCPServer.new(80)

loop do
  client = socket.accept
  first_line = client.gets
  verb, path = first_line.split.first(2)

  if verb == 'GET'
    if result = path.match(/^\/customers\/(.*?)$/)
      user_id = result[1]

      body = IO.read('example.html')
      body.gsub!('{{user_id}}', user_id)

      status = 200

      response = "HTTP/1.1 #{status}\r\nContent-Type: text/html\r\n\r\n#{body}"

      client.puts(response)
    else
      internal_server_error(client)
    end
  elsif verb == "HEAD"
    if result = path.match(/^\/customers\/(.*?)$/)
      status = 200
      response = "HTTP/1.1 #{status}\r\nContent-Type: text/html\r\n\r\n"
      client.puts(response)
    else
      internal_server_error(client)
    end
  else
    internal_server_error(client)
  end

  client.close
end

socket.close
