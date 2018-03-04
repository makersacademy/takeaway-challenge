
class Restaurant

  attr_reader :menu

  def initialize
    @menu = { "spring roll" => 0.99, "char sui bun" => 3.99,
      "pork dumpling" => 2.99, "peking duck" => 7.99,
      "fu-king fried rice" => 5.99 }
  end

  def display_menu
    @menu.each do | dish, price |
      puts "#{dish}  ---  #{price}"
    end
  end

end
