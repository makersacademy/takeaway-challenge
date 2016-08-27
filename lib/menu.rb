# => Knows everything about menu

require 'csv'

class Menu

  def initialize(aFile='menu.csv')
    @items_list = {}
    @aFile = aFile
    load_list
  end

  def return_list
    items_list
  end

  def get_price(name)
    items_list[name]
  end

  def load_list(aFile=@aFile)
    loaded_list = {}
    CSV.foreach(aFile, headers: true) do |row|
        loaded_list[row["item"]] = row["price"].to_f
    end
    self.items_list = loaded_list
  end

private

  attr_accessor :items_list

end
