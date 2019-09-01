require_relative 'takeaway'

class Order

 attr_reader :basket

def initialize
  @basket = {}
end

  def add_items(item,quantity)
  @basket[item] = quantity
  end

  def basket_contents
    @basket.each do |dish,quantity|
      puts "#{dish} x #{quantity} total: £#{Menu.new.menu[dish] * quantity}"
     end
  end
  #@basket.each do |item, quantity|
      #puts "#{quantity}x #{item}: £#{Menu.new.menu[item] * quantity}"

end
