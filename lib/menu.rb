require_relative 'item'

class Menu

  def initialize
    @menu = []
    add("salad", "£5.00")
    add("sausages", "£10.00")
    display
  end

  def add(name, price, item = Item.new(name, price))
    @menu << item
  end

  def display
    @menu.each do |item|
      puts "#{item.name}: #{item.price}"
    end
  end

end
