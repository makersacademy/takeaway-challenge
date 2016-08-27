require 'csv'

class Menu

  def initialize
    @items_list = {}
  end

  def print_list
    items_list
  end

  def get_item(name)
    items_list[name]
  end

  def load_list(aFile)
    loaded_list = {}
    CSV.foreach(aFile, headers: true) do |row|
        loaded_list[row["item"]] = row["price"].to_f
    end
    self.items_list = loaded_list
  end

private

  attr_accessor :items_list

end
