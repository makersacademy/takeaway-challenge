class Menu
  attr_reader :dishes, :menu

  MENU = {
      1 => { curry: 4.00 },
      2 => { chicken: 3.00 },
      3 => { chips: 1.00 },
      4 => { rice: 2.00 }
  }

  def view
    MENU
  end

end

=begin
p a = Menu.new
p a.select(2, 2)
p a.select(1,2)
p a.dishes
=end