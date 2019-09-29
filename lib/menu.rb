class Menu

attr_reader :menu

    MENU = [{"dosa" => 5},
    {"pizza" => 5},
    {"biryani" => 10},
    {"fried rice" => 4},
    {"dim sum" => 8},
    {"pad thai" => 10}]

  def initialize
    @menu = MENU
  end

  def price_list
    @menu.each do |dish, price|
      puts "#{dish} => #{price}"
    end
  end



end
