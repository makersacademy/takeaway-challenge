require 'csv'

class Menu

  def self.hash
    Hash[*self.read_from_csv.flatten]
  end

  private

  def self.read_from_csv
    CSV.read("menu.csv").map{ |e|
      self.format_for_menu(e)
    }
  end

  def self.format_for_menu(array)
    [ array[0].to_sym, array[1].to_f ]
  end
end
