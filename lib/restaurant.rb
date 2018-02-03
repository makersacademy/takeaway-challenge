
class Restaurant

MENU = {"Pepes Ikan" => 3, "Satay" => 3, "Bakso Urat" => 4, "Soto" => 4, "Nasi Goreng" => 5}

  def print_menu
    puts "Our traditional indonesian menu includes:\n"
    MENU.each do |key, value|
      puts "#{key}: £#{value}"
    end
  end
end
