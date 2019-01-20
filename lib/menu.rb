class Menu
  attr_reader :menu_items
  def initialize
    @menu_items = {"rat soup" => 4, "mystery meat pie" => 5, "moldy bread" => 1, "stale juice" => 2 }
  end
end

# {
# [
#   { name: "rat soup", price: 4 },
#   { name: "mystery meat pie", price: 5 },
#   { name: "moldy bread", price: 1 },
#   { name: "stale juice", price: 2 }
# ]
