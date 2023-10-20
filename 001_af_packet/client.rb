require 'socket'

socket = Socket.new(Socket::AF_PACKET, Socket::SOCK_RAW)
socket.connect(Socket.pack_sockaddr_in(0, 'eth0'))

socket.send("Hello world", 0)
socket.close
