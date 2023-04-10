def internal_server_error(client)
  client.puts("HTTP/1.1 500\r\n\r\n")
end
