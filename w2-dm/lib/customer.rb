class Customer

  attr_reader :selected_items, :total
  
  def initialize
    @menu = Menu.new
    @selected_items = []
    @total = 0
  end

  def show_menu
    @menu.print
  end

  def select
    @menu.options.each do |item, price|
      @item = item
      @price = price.to_i
      select_item
    end
    @selected_items
  end

  def show_total
    calculate
  end

end

private

  def select_item
    puts "How many of each #{@item} do you want"
    quant = gets.chomp.to_i
    temp = {quant => @price}
    @selected_items << temp
  end

  def calculate
    @selected_items.each do | hash |
      hash.each_pair do | k, v | @total += (k * v) end
    end
    @total
  end

