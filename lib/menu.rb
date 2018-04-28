class Menu
  attr_reader :item_list

  def initialize
    @item_list = []
  end

  def add_item(item)
    @item_list << item
  end

  def display
    @item_list.each do |item|
      puts "#{item[:name]} - £#{item[:price]}"
    end
  end
end
