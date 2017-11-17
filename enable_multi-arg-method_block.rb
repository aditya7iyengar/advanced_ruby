# If you want to call a function that takes two arguments as a block to a yielder,
# there's no way in ruby you can do that
# [1,2].map(&:to_s)
#
# Something like the code below fails
# [1, 2, 3, 4].map(&:(*2))
#
# One way to accomplish it is by currying

def curriedfn(mul); -> (x) { x * mul }; end

puts [1, 2, 3, 4].map(&curriedfn(2))

# Another way is a "clever" one

class Symbol
  def call(*argv)
    ->(yielder) { yielder.send(self, *argv) }
  end
end

# This allows us to instantiate a lambda and send symbol as the function
puts :+.(2).call(1)

puts [1, 2, 3, 4].map(&:*.(2))

def mul2(a)
  a * 2
end

puts [1, 2, 3, 4].map(&method(:mul2))

def mul(a, b)
  a * b
end

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

class Method
  def with(*argv)
    ->(passed) { self.call(*([passed] + argv)) }
  end
end

puts [1, 2, 3, 4].map(&method(:mul).with(2))
