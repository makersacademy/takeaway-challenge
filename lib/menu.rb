class Menu

  def initialize(item_array = [[]])
    @item_array = item_array
  end

  def show
    "Welcome to the Catnip emporium:\nThis is our menu"
    items.each do |item|
      puts "#{item[0]} \t #{item[1]}"
    end
  end

  def items
    @item_array
  end

end
