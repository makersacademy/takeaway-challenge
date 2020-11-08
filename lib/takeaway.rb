class Takeaway

  def initialize(menu = { "pizza" => 4.99, "burger" => 9.99, "steak" => 14.50,
    "ice cream" => 3.99, "chow mein" => 6.99 })
    @menu = menu
  end

  def read_menu
    @menu
  end
end
