require 'socket'
require 'fileutils'

trap("INT") do
  puts "Signal SIGINT received. Exiting..."
  FileUtils.rm('client.sock')
  exit
end

trap("EXIT") do
  puts "Signal EXIT received. Exiting..."
  FileUtils.rm('client.sock')
  exit
end

socket = Socket.new(Socket::AF_UNIX, Socket::SOCK_DGRAM, 0)

client_addrinfo = Socket.pack_sockaddr_un('client.sock')
server_addrinfo = Socket.pack_sockaddr_un('server.sock')

socket.bind(client_addrinfo)

socket.send("Hello from client", 0, server_addrinfo)
puts "Server says: #{socket.recv(1024)}"

socket.close
