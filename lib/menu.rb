class Menu

  attr_reader :menu

  def initialize
    @menu = [{id: 01, name: "Kebap", price: 1.00},
        {id: 02, name: "Breakfast", price: 1.00},
        {id: 03, name: "Pizza", price: 1.00}]
  end

end
