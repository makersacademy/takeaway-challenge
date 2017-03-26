class Basket #holds the items ordered

  attr_reader :items
  attr_writer :items

  def initialize
    @items = []
  end

end
