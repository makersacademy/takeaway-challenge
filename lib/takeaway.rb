class Takeaway
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end 
  
  def my_order
    if menu.ready?
      menu.dish
      menu.price
      menu.order
    end 
  end

end 

# menu = Menu.new("Chicken")
# takeaway = Takeaway.new(menu)
# takeaway.my_menu

