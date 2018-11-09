require_relative 'menu'

class Takeaway

  def initialize(menu)
    @menu = menu
  end

  def view_menu
    @menu.items.each_with_index do |item, index|
      puts "#{index + 1}: #{item[:name]} £#{item[:cost]}"
    end
  end

  def order
    cost_total = 0
    puts 'Enter the number of the menu item'
    puts "Enter 'done' to complete"
    while true do
      item_number = gets.chomp
      break if item_number == 'done'
      cost_total += @menu.items[item_number.to_i - 1][:cost]
      puts "#{@menu.items[item_number.to_i - 1][:name]} added to basket"
      puts "current total: £#{cost_total}"
    end
  end

end

shop = Takeaway.new(Menu.new)
shop.view_menu
shop.order
