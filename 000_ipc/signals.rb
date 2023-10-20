trap("USR1") do
  puts "Signal USR1 received. Exiting..."
end

puts "Waiting for signal USR1..."

sleep 999999
