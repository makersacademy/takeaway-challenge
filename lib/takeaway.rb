require_relative 'restaurant'

class Takeaway
  attr_reader :basket

  def initialize(restaurant = Restaurant.new)
    @dishes = restaurant
    @basket = []
  end

  # choose a dish from the menu

  def read_menu
    @dishes.print_menu
  end

  def order(dish, quantity = 1)
    chosen_dish = @dishes.menu.select { |k, _v| k == dish.to_sym }
    raise "Hmm...no such dish" if chosen_dish.empty?

    quantity.times { add(chosen_dish) }
    puts "#{quantity}x #{dish} added to your basket."
  end

  def total
    basket.flat_map(&:values).inject(:+)
  end

  def basket_summary
    basket.inject { |item, price| item.merge(price) { |_k, p, sum| p + sum } }
  end

  def checkout(customer_total)
    raise "Incorrect total provided. Basket total is #{total}" if customer_total != total

    send_sms
    puts "Successfully placed the order. A text confirmation will be sent to you shortly."
  end

  private

  # add the dish choice x 1 to the basket
  def add(chosen_dish)
    basket << chosen_dish
  end

  def send_sms
    load './lib/send_sms.rb'
  end
end
