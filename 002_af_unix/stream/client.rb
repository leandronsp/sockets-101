require 'socket'

socket = Socket.new(Socket::AF_UNIX, Socket::SOCK_STREAM)
socket.connect(Socket.pack_sockaddr_un('socket.sock'))

socket.send("Hello from client", 0)
puts "Server says: #{socket.recv(1024)}"

socket.close
