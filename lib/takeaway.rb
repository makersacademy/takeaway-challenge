require_relative 'menu'
require_relative 'basket'

class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = Basket.new
    @subtotal = 0
  end

  def order
    @is_ordering = true
    while is_ordering?
      order_loop
    end
    @subtotal = check_basket
  end

  private

  def checkout
    puts "Order placed!"
    basket
  end

  def confirm_basket
    puts "Choose option:"
    puts "1. Checkout basket"
    puts "2. Add to basket"
    puts "3. Clear basket"
    case gets.chomp
    when "1"
      checkout
    when "2"
      order
    when "3"
      @basket = Basket.new
      order
    else
      confirm_basket
    end
  end

  def check_basket
    basket.check_basket
    confirm_basket
  end

  def list_dishes
    i = 1
    menu.menu.each do |dish, price|
      puts "#{i}: #{dish} - £#{price}0"
      i += 1
    end
  end

  def order_loop
    show_menu
    index = get_index
    if index == 'order'
      @is_ordering = false
      return basket
    end
    quantity = get_quantity
    add_to_basket(index, quantity)
  end

  def on_menu?(item)
    menu.on_menu?(item)
  end

  def is_ordering?
    @is_ordering
  end

  def show_menu
    puts "Menu"
    list_dishes
  end

  def get_index
    puts "Please enter the number of the item you want"
    puts "If finished ordering type 'order'"
    gets.chomp
  end

  def get_quantity
    puts "Please enter the quantity of selected item"
    gets.chomp
  end

  def add_to_basket(index, quantity)
    raise 'Item number invalid' if index.to_i <= 0 || index.to_i > 7
    raise 'Quantity must be greater than zero' if quantity.to_i <= 0
    basket.add(index_to_item(index), quantity, index_to_price(index))
  end

  def index_to_item(index)
    menu.index_to_item(index)
  end

  def index_to_price(index)
    menu.index_to_price(index)
  end

end
