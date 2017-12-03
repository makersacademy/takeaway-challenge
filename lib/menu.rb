class Menu

attr_reader :menu

  def initialize
    @menu = menu
  end

  def menu
    @menu = {"chow mein": 5, "sweet sour chicken": 6}
  end

  def print_menu
    @menu.map{|dish, price| "#{dish} is #{price.to_f}" }.join(", ")
  end

end
