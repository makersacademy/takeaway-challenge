class Menu
  attr_reader :menu_items
  def initialize
    @menu_items = [
      {name: "rat soup", price: 4},
      {name: "mystery meat pie", price: 5},
      {name: "moldy bread", price: 1},
      {name: "stale juice", price: 2}
    ]
  end
end
