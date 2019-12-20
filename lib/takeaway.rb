class Takeaway

  attr_reader :items

  def initialize
    @items = {"pizza" => 10}
  end

  def menu
    @items
  end

end
