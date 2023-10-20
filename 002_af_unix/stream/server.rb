require 'socket'
require 'fileutils'

trap("INT") do
  puts "Signal SIGINT received. Exiting..."
  FileUtils.rm('socket.sock')
  exit
end

trap("EXIT") do
  puts "Signal EXIT received. Exiting..."
  FileUtils.rm('socket.sock')
  exit
end

socket = Socket.new(Socket::AF_UNIX, Socket::SOCK_STREAM)

socket.bind(Socket.pack_sockaddr_un('socket.sock'))
socket.listen(1)

puts "Waiting for client..."
client_socket, client_addrinfo = socket.accept

puts "Client says: #{client_socket.recv(1024)}"

client_socket.send("Hello from server", 0)
client_socket.close

socket.close
