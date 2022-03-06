require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def add_dish(item)
    @menu.check_availability(item)
    @basket[item] += @menu.dishes[item]
  end

  def remove_dish(item)
    check_basket(item)
    @basket[item] -= @menu.dishes[item]
  end

  def view_basket
    check_empty_basket
    print_subtotals
    print_total
  end

  def place_order(payment)
    check_empty_basket
    review_payment(payment)
    thank_you(payment)
  end

  private

  def check_basket(item)
    msg = "Item not in the basket!"
    raise msg if @basket[item] <= 0 
  end

  def print_subtotals
    @basket.each do |item, price| 
      if price.positive?
        qty = (@basket[item] / @menu.dishes[item]).round
        puts "#{qty}x #{item} £#{price}"
      end
    end
  end

  def checkout_total
    @basket.select { |_, price| price.positive? }.values.reduce(:+)
  end

  def print_total
    puts "----------------"
    puts "Order Total £#{checkout_total}"
  end
  
  def empty_basket?
    @basket.empty? || @basket.values.all? { |value| value <= 0 }
  end

  def check_empty_basket
    msg = "Your basket is currently empty. Please add item first."
    raise msg if empty_basket?
  end

  def review_payment(payment)
    msg = "Please enter the correct payment amount."
    raise msg if payment != checkout_total
  end

  def thank_you(payment)
    "Thank you for your order!" if payment == checkout_total
  end
end
