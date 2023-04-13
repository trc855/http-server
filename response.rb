def get_response(result)
  user_id = result[1]

  body = IO.read('example.html')
  body.gsub!('{{user_id}}', user_id)

  response = head_response +
             "#{body}"
end

def head_response
  response = "HTTP/1.1 200\r\n" +
             "Content-Type: text/html\r\n" +
             "\r\n"
end
