require 'csv'

class Menu < Array

  def initialize
    load_menu
  end

  def load_menu
    CSV.foreach("menu.csv", headers: true, header_converters: :symbol) do |row|
      self << row.to_h
    end
  end  

end