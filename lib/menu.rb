class Menu

attr_reader :menu_list

  def initialize
    @menu_list = []
  end


def add(food, amount)
  dish = Hash.new
  dish[:food] = food
  dish[:amount] = amount
  @menu_list << dish
end

def current_menu
  @menu_list
end

end
