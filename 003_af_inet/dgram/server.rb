require 'socket'

# UDP
socket = Socket.new(Socket::AF_INET, Socket::SOCK_DGRAM, 0)

socket.bind(Socket.sockaddr_in(3000, '0.0.0.0'))

data, client_addrinfo = socket.recvfrom(1024)

puts "Client says: #{data}"

socket.send("Hello from server", 0, client_addrinfo)

socket.close
