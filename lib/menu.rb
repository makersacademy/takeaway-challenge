require 'csv'

class Menu
  attr_reader :menu

  def initialize
    @menu= []
    load_menu
  end

  def print_menu
    @menu.each do |item|
      puts "#{item[:number]}. #{item[:name]} - £#{'%.2f' % item[:price]}"
    end
  end


  private
  def load_menu
    CSV.foreach("./lib/menu.csv") do |row|
      number, name, price = row[0..2]
      add_item_to_menu(number, name, price)
    end
  end

  def add_item_to_menu(number, name, price)
    @menu << {number: number, name: name, price: price.to_f}
  end

end
