# Sockets 101

Introdução a sockets.

## IPC

* Pipes
* Named pipes
* Signals
* Sockets

## Pipes

```bash
$ echo leandro | base64
```

## Named pipes

```bash
$ mkfifo myfifo
$ cat myfifo &
$ echo leandro > myfifo
```

## Signals

```ruby
trap("USR1") do
  puts "Signal USR1 received. Exiting..."
  exit
end

puts "Waiting for signal USR1..."

sleep 999999
```

```bash
$ ps ax | grep ruby
$ kill -USR1 <pid>
```

## Sockets 

Exemplo de sockets com AF_UNIX.

### Server
```ruby
require 'socket'

socket = Socket.new(Socket::AF_UNIX, Socket::SOCK_STREAM)

socket.bind(Socket.pack_sockaddr_un('socket.sock'))
socket.listen(1)

client_socket, client_addrinfo = socket.accept

puts "Client says: #{client_socket.recv(1024)}"

client_socket.send("Hello from server", 0)
client_socket.close

socket.close
```

### Client
```ruby
require 'socket'

socket = Socket.new(Socket::AF_UNIX, Socket::SOCK_STREAM)

socket.connect(Socket.pack_sockaddr_un('socket.sock'))

socket.send("Hello from client", 0)
puts "Server says: #{socket.recv(1024)}"

socket.close
```
