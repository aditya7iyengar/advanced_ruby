def yielder
  puts "Before yield"
  yield
  puts "After yield"
end

a = 1

yielder do
  puts "Yielding #{a}"
end

def blocker(&block)
  puts "Before block"
  block.call
  puts "After block"
end

private def b; 10; end

blocker do
  puts "Blocking #{b}"
end


def instancer(&block)
  instance_eval(&block)
end

private def c; 100; end

instancer do
  puts "Instancing #{c}"
end
