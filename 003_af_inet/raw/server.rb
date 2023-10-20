require 'socket'

socket = Socket.new(Socket::AF_INET, Socket::SOCK_RAW, 42)
socket.bind(Socket.sockaddr_in(3000, '0.0.0.0'))

data, client_addrinfo = socket.recvfrom(1024)

puts "Client says: #{data}"

socket.close
