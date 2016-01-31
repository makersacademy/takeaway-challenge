class Takeaway

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu
  end

  def basket
    @basket.dup
  end

  def show_menu
    @menu.list.dup
  end

  def order(item, quantity = 1)
    fail 'Item not in menu!' unless @menu.list.include?(item)
    @basket[item] += quantity
  end
end
