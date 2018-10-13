class Menu
  attr_reader :items
  def initialize(items = Hash.new)
    @items = items
  end
end