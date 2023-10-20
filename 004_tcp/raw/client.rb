require 'socket'

socket = TCPSocket.new('0.0.0.0', 3000)

socket.send("Hello from client", 0)

puts "Server says: #{socket.recv(1024)}"

socket.close
