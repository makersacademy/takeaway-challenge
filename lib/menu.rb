require 'csv'

class Menu < Array

  def display_menu
    puts "\nToday's menu\n-------------"
    load_menu
    print_menu
  end

  def load_menu
    CSV.foreach("menu.csv", headers: true, header_converters: :symbol) do |row|
      self << row.to_h
    end
  end  

  def print_menu
    self.each do |item|
      puts "#{item[:dish]} - £#{item[:price]}"
    end
  end
end