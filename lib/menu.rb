require 'csv'

class Menu
  attr_reader :menu

  def initialize
    @menu= []
  end

  def load_menu
    CSV.foreach("./lib/menu.csv") do |row| # nb could alter this at later date to allow different menu to be loaded
      number, name, price = row[0..2]
      add_item_to_menu(number, name, price)
    end
  end


  private
  def add_item_to_menu(number, name, price)
    @menu << {number: number, name: name, price: price}
  end

end
