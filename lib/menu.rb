class Menu
  attr_reader :items
  
  def initialize 
    @items = [{ dish: "Beef Burrito", price: 10.00 }, { dish: "Chicken Burrito", price: 9.00 }, { dish: "Veggie Burrito", price: 8.00}]
  end

  def to_s
    str = ""
    @items.each_with_index do |item, index| 
      str << "#{index + 1}. #{item[:dish]} - £#{'%.2f' % item[:price]}\n"
    end
    str
  end
end