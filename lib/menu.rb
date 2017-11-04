class Menu

  def initialize
    @info = [[:Satay, 5.00], [:Kuih, 3.00], [:RotiCanai, 6.00], [:Bihun, 8.00]]
  end

  def print_menu_info
    @info.each_with_index do |food, num|
      puts "#{num + 1} #{food[0]}, $#{food[1]}"
    end
  end

end
