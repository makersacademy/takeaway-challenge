class Basket

  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

end
