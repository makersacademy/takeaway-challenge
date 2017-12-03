
require 'csv'

class Menu

attr_reader :list

  def initialize
    @list = read_from_csv
  end

  def read_from_csv
    CSV.read("menu.csv").to_h
  end

end
