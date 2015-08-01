class TakeAway
  attr_reader :menu
  attr_accessor :order, :prices

  def initialize
    @order = {}
    @prices = []
  end

  def add_menu(menu)
    @menu = menu.dishes
  end

  def show_menu
    menu
  end

  def place_order(items={})
    items.each do |dish, quantity|
      raise "#{dish.capitalize} is not on the menu." unless menu.include?(dish)
      order["#{dish} x #{quantity}"] = total_cost_per_item(menu[dish], quantity)
    end
  end

  def show_order
    order
  end

  def total_cost_per_item(price, quantity)
    price_in_pence = ((price * 100).round * quantity)
    prices << price_in_pence
    "%.2f" % (price_in_pence / 100.0)
  end

  def delete_from_order(dish, quantity)
    order.delete("#{dish} x #{quantity}")
  end

  def grand_total
    total_in_pence = prices.inject(:+)
    "%.2f" % (total_in_pence / 100.0)
  end

  def confirm_order
    puts "Please confirm that your order is correct by typing Y for Yes or N for No."
    puts order
    confirmation = gets.chomp
    if confirmation == "Y"
      #text
    else
      "Please edit your order."
    end
  end
end

