class Menu
  attr_reader :items, :basket
  def initialize
    @items = [{name: "Burger", price: 2.00}, {name: "Hot Dog", price: 1.50}]
    @basket = []
  end  

  def view_menu
    @returned_items = ["---Menu---"]
    @items.each do |item|
      price = "%.2f" % item[:price]
      @returned_items.append"\n#{item[:name]} - £#{price}"
    end
    return @returned_items.join
  end

  def order (item_name,amount)
    @items.each do |item|
      if item[:name] == item_name
        amount.times { @basket.append(item) }
      end
    end
  end

  def total
    total = 0
    @basket.each do |item|
      total += item[:price]
    end
    return_price = "%.2f" % total
    return "£#{return_price}"
  end 
end