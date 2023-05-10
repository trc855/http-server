# HTTP-server


## What is it?
This repo is for a primitive HTTP server I have been tinkering around with in order to gain a better understanding of HTTP and network programming in general.

## How to run it?
The server can be started with the following command:
`ruby http_server.rb`

Once the server is running, test the server by visiting [http://localhost:80/customers/tester](http://localhost:80/customers/tester).

Or the following command to see what the response actually looks like:
`echo 'GET /customers/tester HTTP/1.1\r\n' | nc localhost 80`

You can run the following command to run the provided tests:
`ruby http_server_test.rb`

## What have I learned so far?
So far I have learned that an HTTP server is actually a TCP server which server HTTP requests.

HTTP is built on top of TCP, which provides a reliable, stream-oriented communication channel between two endpoints. When a client makes an HTTP request, it sends the request to the server over a TCP connection. The server then parses the request, generates a response, and sends the response back to the client over the same TCP connection.

In practice, a web server would include additional functionality beyond just serving HTTP requests, such as handling multiple simultaneous connections, managing resources like files and databases, and enforcing security policies. However, the core functionality of a web server is indeed to listen on a TCP socket for incoming HTTP requests, and send back HTTP responses to the client.


More to come 👨‍💻
