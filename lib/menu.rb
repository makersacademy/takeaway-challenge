class Menu

  attr_reader :name, :price

  MENU = {:hotdog => 2.00,
          :chessebuger => 1.49,
          :Hamburger => 0.99,
          :Fries => 0.99
        }
  def initialize (name)
    @name = name
    @price = MENU[name]
  end

end
