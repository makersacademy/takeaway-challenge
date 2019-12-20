class Takeaway

  attr_reader :items

  def initialize
    @items = {"pizza" => 10, "chips" => 2, "wings" => 5, "coke" => 1, "chicken" => 6, "pasta" => 7.50}
  end

  def menu
    @items
  end

end
