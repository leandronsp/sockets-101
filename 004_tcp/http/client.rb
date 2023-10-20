require 'socket'

socket = TCPSocket.new('0.0.0.0', 3000)

message = <<HTTP
GET /time HTTP/2
Host: localhost:3000

HTTP

socket.puts(message)

while line = socket.gets
  puts line
end

socket.close
