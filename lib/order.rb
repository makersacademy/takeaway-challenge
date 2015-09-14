require_relative 'texting'

class Order

  include Texting

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(menu, dish_number, quantity)
    quantity.times do
      @basket << menu.select(dish_number)
    end
  end

  def summary
    fail "Basket empty" if empty_basket?
    basket_hash = dishes_and_quantities
    basket_hash.each_pair do |k, v|
      puts "#{v}x #{k.name} | £#{'%.2f' % (v * k.price)}"
    end
    puts "Total cost: £#{'%.2f' % total_cost}"
  end

  def submit(payment)
    fail "Basket empty" if empty_basket?
    fail "Payment does not match total cost" if payment != total_cost
    send_text
  end

  private

  def total_cost
    ('%.2f' % basket.inject(0){|sum, x| sum + x.price}).to_f
  end

  def empty_basket?
    basket.count == 0
  end

  def dishes_and_quantities
    basket_hash = {}
    basket.uniq.each do |a|
      basket_hash[a] = basket.count(a)
    end
    basket_hash
  end

  def send_text
    Texting.send_text
  end

end