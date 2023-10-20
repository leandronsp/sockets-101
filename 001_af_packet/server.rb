require 'socket'

socket = Socket.new(Socket::AF_PACKET, Socket::SOCK_RAW)
socket.bind(Socket.pack_sockaddr_in(0, 'eth0'))

packet = socket.recv(65535)
payload = packet[14..-1] # Remove the Ethernet header

puts "Message received: #{payload}"

socket.close
