class Menu
  attr_reader :items

  def initialize(*foods)
    @items = []
    @items += foods
  end

  def view
    @items.each { |i| puts "#{i.name} - £#{i.price}" }
  end

end
