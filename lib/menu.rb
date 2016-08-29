# Understands the pricing of food items
class Menu
  def initialize
    @menu = { 'spring roll' => 0.99, 'peking duck' => 7.99 }
  end

  def to_s
    puts 'Here is the menu:'
    menu.each do |item, price|
      puts "#{item.capitalize} - $#{price}"
    end
  end

  def check_price(item)
    fail 'Item not on menu' unless match_item(item)
    match_item(item)
  end

  def calculate_subtotal(basket)
    output = []
    basket.each do |item, quantity|
      output << [item, quantity, match_item(item) * quantity]
    end
    output
  end

  private

  attr_reader :menu

  def match_item(item)
    menu[item.downcase]
  end
end
