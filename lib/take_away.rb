class TakeAway

  attr_reader :basket, :menu

  def initialize(name = 'Los Pollos Hermanos', menu = Menu.new)
    @basket = Order.new
    @menu = menu
    @name = name
  end

  def add_to_basket(number, quantity = 1)
    quantity.times { @basket.items << @menu.list[number - 1] }
  end

  def display_menu
    print_header
    puts @menu.pretty_print
    print_footer
  end

  def basket_total
    "The current total of your order is £#{@basket.total}"
  end

  def checkout(price)
    price != @basket.total ? payment_error : confirmation_message
  end

  private

  def print_header
    puts "#{@name}"
    puts '=' * 30
  end

  def print_footer
    puts '=' * 30
  end

  def payment_error
    raise 'Input payment does not equal basket total.'
  end

  def confirmation_message
    puts 'Thanks. Text confirmation has been sent.'
  end

end
