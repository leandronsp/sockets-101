require 'socket'

# TCP
socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

socket.bind(Socket.sockaddr_in(3000, '0.0.0.0'))
socket.listen(1)

client_socket, client_addrinfo = socket.accept

puts "Client says: #{client_socket.recv(1024)}"

client_socket.send("Hello from server", 0)
client_socket.close

socket.close
