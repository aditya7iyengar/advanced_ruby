puts Array.new.methods.include? :red

class Array
  def red(acc)
    i = 0

    while i < self.length
      acc = yield(self[i], acc)
      i += 1
    end

    acc
  end
end

puts Array.new.methods.include? :red


final_value = [1, 2].red(1) do |x, y|
  x + y * y
end

puts final_value
