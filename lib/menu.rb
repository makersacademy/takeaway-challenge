require_relative 'menu'
require "csv"

class Menu

  def initialize

  end

  def load
    file = CSV.read("./lib/menu.csv")
    puts file
  end
end
