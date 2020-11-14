class Menu

  attr_reader :menu

  MENU = { :dosa => 5 ,
  :pizza => 4.50 }

  def initialize
    @menu = MENU
  end

  def price_list
    @menu.map do |key, price|
      "%s £%.2f" % [key.to_s, price]
    end.join(", ")
  end

end
