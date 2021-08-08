require_relative 'menu'
require_relative 'order'

class Takeaway

attr_reader :menu, :new_array 

def view_menu
    @menu = Menu.new
    @new_array = @menu.menu
    print_menu
end

def create_order
    @my_order = Order.new
end

def print_menu
  @new_array.each.with_index(1) do |subhash, index|
        puts "#{index}. #{subhash[:item]}, #{subhash[:price]}"
  end
end

end