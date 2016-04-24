class Menu

  def initialize
    @menu = {"diet coke"=>0.99, "foie gras"=>18.50, "caviar"=>99.00, "oyster"=>0.99, "champagne"=>50.00}
  end
  def view_menu
    @menu
  end


end

# menu = Menu.new
# menu.select {|k,h| k == choice}