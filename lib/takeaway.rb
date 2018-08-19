require './data/takeaway_menu.rb'

class Takeaway

  attr_reader :menu
  attr_accessor :basket

  def initialize(menu = MENU_LIST)
    @menu = menu
    @basket = []
  end

  def display_menu
    menu
  end

  def add_item(name, quantity)
    quantity.times do
      basket.push(name.capitalize)
    end
    @basket
  end

  def calculate_total
    basket.map do |name|
      get_price(name)
    end.reduce(0, :+)
  end

  def get_price(name)
    total = @menu[name]
  end
end