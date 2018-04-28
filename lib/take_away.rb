class TakeAway

  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def read_menu
    @menu.list
  end

  def order(dish, quantity = 1)
    @menu.list.each_key do |item|
      if item == dish
        @basket[dish] += quantity
      end
    end
  "#{quantity}x #{dish}(s) added to your basket"
  end

end
