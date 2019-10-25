class Menu
  attr_reader :items
  def initialize
    @items = [{name: "Burger", price: 2.00}, {name: "Hot Dog", price: 1.50}]
  end  

  def view_menu
    @returned_items = ["---Menu---"]
    @items.each do |item|
      price = "%.2f" % item[:price]
      @returned_items.append"\n#{item[:name]} - £#{price}"
    end
    return @returned_items.join
  end
end