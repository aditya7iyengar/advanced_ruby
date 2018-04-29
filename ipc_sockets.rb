require 'socket'

def process_puts(msg)
  puts "#{Process.pid}: #{msg}"
end

SOCK = 0.freeze
MAXLEN = 1000

sock1, sock2 = Socket.pair(:UNIX, :DGRAM, SOCK)

fork do
  sock2.close

  8.times do
    case sock1.recv(MAXLEN)
    when "A"
      process_puts "Got A"
    when "B"
      process_puts "Got B, yay!"
    when "C"
      process_puts "Got C, boo!"
    else
      sock1.send("---- MatchError", SOCK)
    end
  end
end

sock1.close

2.times do
  sock2.send("A", SOCK)
end

2.times do
  sock2.send("B", SOCK)
end

2.times do
  sock2.send("C", SOCK)
end

2.times do
  sock2.send("D", SOCK)
end

2.times do
  process_puts "Rcvd: #{sock2.recv(MAXLEN)}"
end
