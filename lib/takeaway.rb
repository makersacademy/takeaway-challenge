require_relative 'menu.rb'

class Takeaway
  def initialize(menuclass = Menu)
    @menuclass = menuclass
    @menu = @menuclass.new
    @basket = Basket.new
  end

  def show_menu
    @menu.display
  end

  def order(itemname, quantity=1)
    name = itemname.downcase
    if @menu.items.include?(name)
       price = @menu.items[name]
       @basket.store(name, quantity, price)
      "#{quantity} x #{name} has been added to your basket"
    else
      "Sorry! We don't have what you've just ordered. Check the menu for what's on offer!"
    end
  end

  def basket_summary
    @basket.show_basket
  end
end
