require 'socket'

socket = TCPServer.new('0.0.0.0', 3000)

puts "Waiting for client..."
client_socket = socket.accept

puts "Client says: #{client_socket.recv(1024)}"

client_socket.send("Hello from server", 0)

client_socket.close

socket.close
