class Takeaway

  attr_reader :menu, :basket

  def initialize
    @basket = Basket.new
    @menu = { potato_smilies: 2,
              turkey_twizzlers: 3,
              rice_pudding: 3,
              panda_pop: 1,
              spaghetti_hoops: 1
            }
  end

  def order(item, quantity)
    raise "This item is unavailable" unless available?(item)
    @basket.orders[item] = quantity
    "Order confirmed: #{item} x#{quantity}"
  end

  private

  def available?(item)
    @menu.has_key?(item)
  end

end
