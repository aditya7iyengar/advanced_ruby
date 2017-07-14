class CSNightInstanceVariable
  @number = 3

  def initialize
    @number ||= 4
  end

  def self.is_even?
    @number % 2 == 0
  end

  def is_even?
    @number % 2 == 0
  end
end

obj = CSNightInstanceVariable.new
puts obj.is_even?
puts CSNightInstanceVariable.is_even?
