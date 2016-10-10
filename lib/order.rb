class Order
attr_reader :dishes

  def initialize(menu)
    @dishes = Hash.new(0)
  end

  def add(dish, quantity = 1)
    if @menu.include?(item)
       @basket[item] = quantity
       @basket
    else
      fail "That's too many eggs, don't be ridiculous."
    end
  end

private
attr_reader :menu

#   def initialize(menu = Menu.new)
#     @basket = {}
#     @menu = menu
#   end
#
end
