class Menu
  attr_reader :list

  def initialize
    @list = { :"Chicken Curry" => 4.99,
      :Pizza => 3.99,
      :Chips => 1.99
    }
    @menu_num = 1
  end

  def print_menu
    @list.each do |item, price|
      puts "#{@menu_num}. #{item} £#{price}"
      @menu_num += 1
    end
  end

end
