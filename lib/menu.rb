require "./lib/option"

class Menu
  
  def initialize(option_type = Option) 
    @option_type = option_type
    @selection = [option_type.new, option_type.new, option_type.new, option_type.new,
                  option_type.new]   
  end

  def choices
    @selection.dup
  end

  def read
    @selection.each do 
       |option| puts "#{option.food}, price: #{option.price}" 
     end
  end

end
