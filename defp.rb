class Object
  def defp(name, &block)
    self.send(:define_method, name, &block)
    self.instance_eval { private name }
  end
end

class Test
  def api(i)
    helper(i)
  end

  defp :helper do |i|
    puts i
  end
end

t = Test.new
t.api("a")
# t.helper # Calling this will give an error
