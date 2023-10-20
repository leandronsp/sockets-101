require 'socket'

socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

socket.connect(Socket.sockaddr_in(3000, '0.0.0.0'))

socket.send("Hello from client", 0)

puts "Server says: #{socket.recv(1024)}"

socket.close
