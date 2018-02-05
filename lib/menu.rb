class Menu
  attr_reader :menu_list

  def initialize
    # pass menu hash as an argument instead
    @menu_list = [
      { desc: "Chips", cost: 1.0 },
      { desc: "Burger", cost: 3.5 },
      { desc: "Coke", cost: 0.8 }
    ]
  end

  def print
    @menu_list.each_with_index do |line, index|
      puts "#{index + 1} #{line[:desc]} £#{line[:cost]}0"
    end
  end

end
