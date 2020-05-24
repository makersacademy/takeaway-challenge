require_relative 'item.rb'
require_relative 'menu.rb'
require_relative 'order.rb'

def item_list
  [nmae1 = Item.new("name1", 1.00), name2 = Item.new("name2", 1.50)]
end

class Front

  def initialize(menu = Menu.new(item_list), order = Order.new)
    @menu = menu
    @order = order
  end

  def main_choice
    loop do
      puts "type: 'leave' to exit, 'menu' for the menu, 'add' to add to the order,
'show order' to show the order or 'confirm order' to confirm the order"
      choice = gets.chomp
      case choice
      when 'leave'
        return "exit"
      when 'menu'
        @menu.show_dishes
      when 'add'
        add_choice
      when 'show order'
        @order.show
      when 'confirm order'
        @order.confirm
      end
    end
  end

  private

  def add_choice
    puts "enter choice in form of 'item_name, quantity', type 'leave' to leave (if no quantity is specified 1 is chosen)"
    loop do
      user_input = gets.chomp.split(", ")
      return false if user_input == ["leave"]
      if @menu.check(user_input[0])
        item = @menu.select(user_input[0])
        quantity = user_input[1] || 1
        @order.add(item[0], quantity.to_i)
      else
        puts "invalid menu choice"
      end
    end
  end

end

# Front.new.main_choice (commeted out to make rspec test coverage possible)
