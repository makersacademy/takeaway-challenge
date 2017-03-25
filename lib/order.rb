# place a specific order
# fulfil_order by confirming to customer

class Order

  attr_reader :item, :basket

  def initialize
    @item = Hash.new(0)
    @basket = []
  end

  def order(dish, quantity)
    self.item = {:dish => dish, :quantity => quantity }
    self.basket << item
    puts "#{quantity}x #{dish} added to your basket"
  end

  private

  attr_writer :item

end
