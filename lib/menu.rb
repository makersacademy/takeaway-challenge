class Menu

  def initialize
    @menu = {
      roast_goose: 13.5,
      minced_goose: 15.5,
      deep_fried_goose: 20
    }
  end

  def view
    puts @menu
  end

end
