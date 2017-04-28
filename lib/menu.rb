require 'csv'

class Menu

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = {}
    load
  end

  def print(filename = "menu_list")
      CSV.foreach("/Users/peterbarcsak/Projects/takeaway-challenge/lib/#{filename}.csv") do |line|
      dish, price = line
      puts "#{dish.upcase}: £#{price.to_f}"
    end
  end

  def load(filename = "menu_list")
      CSV.foreach("/Users/peterbarcsak/Projects/takeaway-challenge/lib/#{filename}.csv") do |line|
      dish, price = line
      @list_of_dishes[dish.to_sym] = price.to_f
    end
  end

end
