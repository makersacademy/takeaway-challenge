class Takeaway

  attr_reader :menu

  def initialize(menu = {'meat feast' => 5.99, 'marinara' => 3.99, 'mexican' => 4.99, 'fully_loaded' => 8.99, 'veg_supreme' => 6.99})
    @menu = menu
  end

  def display_menu
    @menu
  end
end
