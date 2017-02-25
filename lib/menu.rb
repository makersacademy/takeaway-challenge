class Menu

  require 'csv'

  attr_reader :list

  def initialize
    @list = []
  end

  def view_price_list
  end

  def load_menu (filename = 'menu.csv')
    CSV.foreach(filename) do |line|
      name, description, price, type = line
      @list << {:name => name, :description => description, :price => price, :type => type}
    end
  end

end
