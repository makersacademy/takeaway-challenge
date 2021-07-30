require "./lib/menu"
class Order
  attr_accessor :basket, :total

  def initialize(menu=Menu.new)
    @menu = menu
    @basket = []
    @total = 0
  end

  def order(item, amount=1)
    #read_menu.has_key?(item)
    chosen_item = @menu.menu.select { |k,v| k == item }

    amount.times{@basket.push(chosen_item)}
    amount.times{@total += chosen_item.values[0]}

    #amount.times{@total += chosen_item}
    "#{amount}x #{item}(s) has been added to your basket 🧺✔️"
  end
end
