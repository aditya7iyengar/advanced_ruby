module Randomm; end

class Object
  include Randomm
end

def show_family_tree(klass)
  begin
    show_family_tree(klass.superclass)
    puts klass
  rescue
    nil
  end
end

begin
  10/0
rescue Exception => ex
  puts "Family tree of the exception #{ex.class}:"
  show_family_tree(ex.class)
  puts "~~~~~~~~~~~~~~~~~~~~~~~"
  puts ex.class.ancestors
end
