class Order
  attr_reader :menu, :basket, :item, :total

  def initialize(menu = Menu)
    @menu = menu.new
    @basket = []
    @item = {}
    @total = 0.00
  end

  def add_item(dish, quantity = 1)
    raise ArgumentError.new("No such item in menu") unless @menu.list.has_key?(dish.downcase)
    @item[:dish] = dish.downcase
    @item[:quantity] = quantity
    @item[:subtotal] = @menu.list[dish.downcase] * quantity
    add_basket
    puts "#{quantity}x #{dish}(s) added to your basket."
  end

  def check_basket
    basket.each { |hash|
      puts "#{hash[:quantity]}x #{hash[:dish]} for #{sprintf "%.2f", hash[:subtotal]}"
      # `sprintf "%2f", NUM` is used to convert NUM
      # into a string which always ends with 2 decimals
    }
    calc_total
    puts "Total price: #{sprintf "%.2f", total}"
  end

  private

  def calc_total
    @total = 0
    basket.each { |hash| @total += hash[:subtotal] }
  end

  def add_basket
    @basket << @item.dup
  end

end
