class Menu
# menu understands the what food options the client can choose from

  attr_reader :choices

  def initialize
    @choices = {
      roast_goose: 13.5,
      minced_goose: 15.5,
      deep_fried_goose: 20
    }
  end

  def view
    puts choices
  end

end
