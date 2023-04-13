require 'socket'
require_relative 'server_errors'
require_relative 'response'

socket = TCPServer.new(80)

loop do
  client = socket.accept

  first_line = client.gets
  verb, path = first_line.split.first(2)
  result = path.match(/^\/customers\/(.*?)$/)

  case verb
  when 'GET'
    if result
      response = get_response(result)
      client.puts(response)
    else
      not_found_error = error(404)
      client.puts(not_found_error)
    end
  when 'HEAD'
    if result
      response = head_response
      client.puts(response)
    else
      not_found_error = error(404)
      client.puts(not_found_error)
    end
  else
    internal_server_error = error(500)
    client.puts(internal_server_error)
  end

  client.close
end

socket.close
