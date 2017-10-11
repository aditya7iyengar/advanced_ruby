class Class
  def attr_acc(*args)
    args.each do |a|
      # self.class_eval("def #{a}; @#{a}; end")
      # self.class_eval("def #{a}=(val); @#{a} = val; end")
      define_method(a) do
        @a
      end

      define_method("#{a}=".to_sym) do |v|
        @a = v
      end
    end
  end
end

class Dev
  attr_acc :role, :team
end

d = Dev.new
d.role = "rails developer"
puts d.role
