class Menu
  attr_reader :items

  def initialize(*foods)
    @items = []
    @items += foods
  end

  def list_items
    @items.map { |i| "#{i.name} - £#{i.price}" }
  end

end
