class Takeaway

  def initialize
    @dishes = { "1 piece chicken meal" => 4.49,
       "2 piece chicken meal" => 5.49,
        "chicken nuggets meal" => 4.49,
         "popcorn chicken meal" => 5.79,
          "spicy wings meal" => 5.49,
          "mega bucket meal" => 24.99 }
  end

  def view_menu
    @dishes
  end

end
