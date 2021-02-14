require_relative 'menu'
require_relative 'formatmenu'
require_relative 'order'
require_relative 'formatorder'
require_relative 'item'
# require_relative 'text'
require_relative 'user'

class UI

  attr_reader :user, :menu, :order

  MENU = ["\n", "Select an option:", "1. View Menu", "2. Add Item", "3. Remove Item", "4. View Order", "5. Complete Order"]
  
  def initialize
    @user = ''
    @menu = Menu.new
    puts "Welcome to Petes-A-Hut"
    get_user()
    @order = Order.new(@user)
    menu()
  end

  def menu
    while true
      puts MENU
      selection = gets.chomp

      case selection
      when '1'
        @menu.print_menu
      when '2'
        add_item()
      when '3'
        remove_item()
      when '4'
        @order.print_order
      when '5'
        # @order.complete
        return
      else
        puts "Try Again"
      end

    end
  end

  def add_item
    puts "Select an item to add using its menu number"
    id = gets.chomp.to_i
    puts "Select a quantity to add"
    quantity = gets.chomp.to_i

    @order.add(@menu.select(id),quantity)
  end

  def remove_item
    puts "Select an item to remove using its menu number"
    id = gets.chomp.to_i
    puts "Select a quantity to remove"
    quantity = gets.chomp.to_i

    @order.remove(@menu.select(id),quantity)
  end

  def get_user
    puts "Enter your name"
    name = gets.chomp
    puts "Enter your phone number"
    number = gets.chomp

    @user = User.new([name,number])
  end

end
