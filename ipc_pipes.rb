reader, writer = IO.pipe

fork do
  10.times do
    writer.puts "#{Process.pid}: End of Process"
  end
end

writer.close

while message = reader.gets
  puts "#{Process.pid}: Recevied --> #{message}"
end
