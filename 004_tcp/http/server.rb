require 'socket'

socket = TCPServer.new('0.0.0.0', 3000)

puts "Server listening on port 3000..."

loop do
  client = socket.accept

  while line = client.gets
    puts line

    break unless line
    break if line.strip.empty?
  end

  client.puts "HTTP/2 200 OK\r\nContent-Type: plain/text\r\n\r\n#{Time.now}"

  client.close
end
