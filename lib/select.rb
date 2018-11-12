require_relative 'menu'

class Select

  attr_reader :my_lunch

  def initialize
    @my_lunch = []
  end

  def my_eats
    my_menu = Menu.new
    my_options = my_menu.display
    my_options.each do |key, value|
      if key.to_i < 6
        @my_lunch.push(key)
      end
    end
  end
end
