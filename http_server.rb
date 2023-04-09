require 'socket'

socket = TCPServer.new(80)

loop do
  client = socket.accept
  first_line = client.gets
  verb, path, _ = first_line.split

  if verb == 'GET'
    if result = path.match(/^\/customers\/(.*?)$/)
      user_id = result[1]
      body = IO.read('example.html')
      body.gsub!('{{user_id}}', user_id)
      status = 200
      response = "HTTP/1.1 #{status}\r\nContent-Type: text/html\r\n\r\n#{body}"
      client.puts(response)
    end
  end

  client.close
end

socket.close
