class Menu
  
  attr_reader :items, :order_total
  
  def initialize
    @items = {
      "Biryani" => 9, "Korma" => 9, "Tikka Masala" => 7, "Set meal 1" => 25, 
      "Naan" => 3, "Pilau rice" => 3, "Poppadom" => 2, 
      "Cake" => 3, "Soft drinks" => 1 
    }
    @order_array = []
  end

  def print_menu
    item_num = 1
    puts "On the menu today we have:"
    items.each do |key, value|
      puts "#{item_num}: #{key} = £#{value}"
      item_num += 1
    end
  end

  def total(selection)
    selection.each { |item| items.each do |description, _price| 
      @order_array << items[description] if item == description
    end 
    }
    @order_total = @order_array.sum
  end
  
end
