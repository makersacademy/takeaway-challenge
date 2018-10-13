class Menu
  attr_reader :items

  def initialize(*foods)
    @items = []
    @items += foods
  end

  def view
    @items.map { |i| "#{i.name} - £#{i.price}" }
  end

end
