require_relative 'menu'
require_relative 'order'
require_relative 'text_message'

class TakeAway

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def launch!
    introduction
    home_options
    home_page(STDIN.gets.chomp.strip.downcase.to_sym)
  end

  def home_options
    puts "\nSelect an Option:\n"
    puts "Type 'Menu' to View Menu"
    puts "Type 'Order' to Place Order"
    puts "Type 'Exit' to Leave\n"
  end

  def home_page(selection)
    case selection
    when :menu then display_menu
    when :order then create_order
    when :exit then exit_programme
    end
  end

  def create_order
    @order = Order.new
    order_options
  end

  def order_options
    puts "\nSelect an Order Option:\n"
    puts "Type 'Add' to Add Item"
    puts "Type 'Remove' to Remove Item"
    puts "Type 'View' to View Basket"
    puts "Type 'Checkout' to Confirm Order"
    puts "Type 'Home' to Reset Order"
    puts "Type 'Exit' to Leave\n"
    order_page(STDIN.gets.chomp.strip.downcase.to_sym)
  end

  def order_page(selection)
    case selection
    when :add then add_item
    when :remove then remove_item
    when :view then view_basket
    when :checkout then checkout
    when :home then launch!
    when :exit then exit_programme
    end
  end

  def add_item
    puts "What would you like to add to your basket?"
    item_choice
    @order.add(@item, @quantity)
    order_options
  end

  def remove_item
    puts "What would you like to remove from your basket?"
    item_choice
    @order.remove(@item, @quantity)
    order_options
  end

  def item_choice
    @item = STDIN.gets.chomp.downcase.to_sym
    select_quantity
  end

  def select_quantity
    puts "How many?"
    @quantity = STDIN.gets.to_i
  end

  def view_basket
    puts "\nThis is your current order:\n"
    @order.display
    order_options
  end

  def checkout
    puts "\nThis is your confirmed order:\n"
    @order.display
    @confirmation_text = TextMessage.new
    @confirmation_text.send
  end

  private

  def introduction
    puts "\n<<< Welcome to Spices of India >>>\n"
  end

  def display_menu
    @menu.print
    launch!
  end

  def conclusion
    puts "\n<<< Goodbye! >>>\n\n"
  end

  def exit_programme
    conclusion
    exit
  end

end

# t = TakeAway.new
# t.launch!
