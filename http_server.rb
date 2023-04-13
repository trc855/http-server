require 'socket'
require_relative 'server_errors'
require_relative 'response'

socket = TCPServer.new(80)

loop do
  client = socket.accept
  first_line = client.gets
  verb, path = first_line.split.first(2)

  if verb == 'GET'
    if result = path.match(/^\/customers\/(.*?)$/)

      response = get_response(result)
      client.puts(response)
    end
  elsif verb == "HEAD"
    if path.match(/^\/customers\/(.*?)$/)
      response = head_response
      client.puts(response)
    end
  else
    internal_server_error(client)
  end

  client.close
end

socket.close
