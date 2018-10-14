class Menu
  attr_reader :items

  def initialize(*foods)
    @items = []
    @items += foods
  end

  def view
    puts "Menu\n~~~~~~~~~~~"
    list_items
  end

  private

  def list_items
    return "No menu set!" if @items.empty?
    @items.each { |i| puts "#{i.name} - £#{i.price}" }
  end

end
