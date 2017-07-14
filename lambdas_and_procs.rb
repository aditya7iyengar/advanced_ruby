def x
  p = proc { |x| return x }
  p.call("apple")
  return "orange"
end

def y
  l = lambda { |x| return x }
  l.call("apple")
  return "orange"
end

puts x
puts y
