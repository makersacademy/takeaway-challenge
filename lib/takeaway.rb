require_relative 'menu'
require_relative 'twiliosms'

class Takeaway
  INITIAL_COST = 0.00

  def initialize(menu_object = Menu.new)
    @menu_object = menu_object
    @choice = []
  end

  def menu
    @menu_object.list
  end

  def add_item(name, cost)
    @menu_object.add(name, cost)
  end

  def pick(item)
    @choice << @menu_object.list.select do |menu_item|
      menu_item.name == item && menu_item.available?
    end[0]
  end

  def display_basket
    @choice
  end

  def sub_total
    @cost = INITIAL_COST
    add_prices
    "£#{@cost.round(2)}"
  end

  def place_order(text = TwilioSMS.new)
    text.send_sms
  end

  private

  def add_prices
    @choice.each do |item|
      @cost += convert_price(item)
    end
  end

  def convert_price(item)
    item.price.gsub("£","").to_f
  end
end
