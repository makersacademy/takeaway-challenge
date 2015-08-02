class Menu

  attr_reader :menu_items

  def initialize
    @menu_items = { 'chicken' => 5.00, 'tuna' => 6.00, 'beef' => 7.00, 'veg' => 6.50 }
  end

end
