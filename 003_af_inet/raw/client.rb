require 'socket'

socket = Socket.new(Socket::AF_INET, Socket::SOCK_RAW, 42)
socket.send("Hello from client", 0, Socket.sockaddr_in(3000, '0.0.0.0'))

socket.close
