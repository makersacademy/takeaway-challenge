class TakeAway

  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def read_menu
    @menu.list
  end

  def order(dish, quantity = 1)
    @menu.list.each_key do |item|
        @basket[dish] += quantity if item == dish
    end
    message(dish, quantity = 1)
  end

  private
  def message(dish, quantity = 1)
    if @menu.list.include?(dish)
      "#{quantity}x #{dish}(s) added to your basket"
    end
  end
end
