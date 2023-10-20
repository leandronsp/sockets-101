require 'socket'
require 'fileutils'

trap("INT") do
  puts "Signal SIGINT received. Exiting..."
  FileUtils.rm('server.sock')
  exit
end

trap("EXIT") do
  puts "Signal EXIT received. Exiting..."
  FileUtils.rm('server.sock')
  exit
end

socket = Socket.new(Socket::AF_UNIX, Socket::SOCK_DGRAM, 0)

server_addrinfo = Socket.pack_sockaddr_un('server.sock')

socket.bind(server_addrinfo)

puts "Waiting for client..."

data, client_addrinfo = socket.recvfrom(1024)

puts "Client says: #{data}"

socket.send("Hello from server", 0, client_addrinfo)

socket.close
