class MyClass

  attr_accessor :a,
                :block

  def initialize(b)
    @a = b
    @block = proc{|x| x * @a }
  end

  def mul(x, y)
    @a = y
    @block.call(x)
  end
end

mc = MyClass.new(100)
puts mc.mul(5, 1)
