require 'csv'

class Menu < Array

  def initialize
    load_menu
  end

  def load_menu
    CSV.foreach("menu.csv", headers: true, header_converters: :symbol, converters: :numeric) do |row|
      self << row.to_h 
    end
  end  

end