def first_instance_of_type(klass)
  found_obj = nil

  20000.times do |num|
    begin
      obj = ObjectSpace._id2ref(num)
      if obj.class == klass
        found_obj = obj
        break
      end
    rescue
    end
  end

  found_obj
end

puts first_instance_of_type(Symbol)
puts first_instance_of_type(String)
puts first_instance_of_type(Integer)
puts first_instance_of_type(Float)
puts first_instance_of_type(NilClass)
