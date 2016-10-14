require 'yaml'

class Menu

  DEF_MENU = [{dish: 'fries', price: 1.0}, {dish: 'fish', price: 1.5}]

  def initialize(menu = DEF_MENU)
    @menu = menu
  end

  def print
    k=1
    @menu.each do |item|
      puts "#{k}. #{item[:dish]} ... £#{item[:price]} "
      k+=1
    end
  end

  def dishes
    @menu
  end

  def number_of_dishes
    @menu.dup.length
  end

  def select(item_number, amt)
    {dish: @menu[item_number-1][:dish], price: @menu[item_number-1][:price], quantity: amt}
  end
end
