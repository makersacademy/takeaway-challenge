require_relative "../lib/basket.rb"

class Takeaway

  attr_reader :menu

  DEFAULT_MENU = {
    "Burger" => { name: "Burger", price: 3 },       
    "Chips" => { name: "Chips", price: 1 },
    "Kebab" => { name: "Kebab", price: 5 } }

  def initialize(menu: DEFAULT_MENU)
    @menu = menu
    @basket = Basket.new
  end
  
  def menu
    string = ""
    @menu.keys.each do |item|
      string += "#{@menu[item][:name]} : £#{@menu[item][:price]}\n"
    end
    return string
  end

  def addBasket(food)
    food = @menu[food]
    @basket.add(food)
  end

  def viewBasket
    @basket.viewBasket
  end

end
