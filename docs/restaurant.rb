class Restaurant
  attr_accessor :list_dishes

  def initialize
    @list_dishes = { "pesto pasta" => 5,
      "ravioli" => 10,
      "pigeon" => 5,
      "arabic herbs" => 10,
      "mud pie" => 5 }
  end

  def menu
    p "Here is a list of our dishes: #{@list_dishes}"
  end

end
