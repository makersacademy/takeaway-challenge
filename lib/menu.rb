class Menu

attr_reader :menu_list, :read_menu

MENU_LIST = {
  "Caesar salad" => 4,
  "Gazpacho" => 3,
  "Tartiflette" => 6,
  "Butternut Squash Risotto" => 6,
  "Roasted Vegetables" => 6,
  "Pumpkin Pie" => 2,
  "Eclair" => 2 }

  def initialize
    @menu_list = MENU_LIST
  end

  # def read_menu
  #   @menu_list.each do | dish, price |
  #     puts "#{dish}: £#{price}"
  #     end
  # end

end
