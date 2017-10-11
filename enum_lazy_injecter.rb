class Enumerator::Lazy
  def each_with_index(index)
    @acc = index

    Lazy.new(self) do |yielder, *result|
      result = yield [*result, @acc]
      yielder << result
      @acc += 1
    end
  end

  def lazy_inject(acc, first, &block)
    @acc = acc

    Lazy.new(self) do |yielder, *result|
      @acc = yield [*result, @acc]
      yielder << @acc
    end.first(first).last
  end
end

adder = ->(a) { a[0] + a[1] }

puts (1..Float::INFINITY).lazy.each_with_index(0, &adder).first(5)
puts (1..Float::INFINITY).lazy.lazy_inject(0, 5) { |a, b| a + b }
