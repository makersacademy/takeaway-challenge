require "csv"

class Menu

  attr_reader :menu

  def initialize
    @menu = CSV.read("./lib/menu.csv")
  end

end
