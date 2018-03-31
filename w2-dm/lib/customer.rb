class Customer

  attr_reader :selected_items, :total, :user_cost

  def initialize
    @menu = Menu.new
    @selected_items = []
    @total = 0
  end

  def show_menu
    @menu.print
  end

  def select(user_cost)
    @user_cost = user_cost
    list_items
    @selected_items
  end

  def show_total
    raise "Incorrect amount stated" if @user_cost != calculate
    @total = calculate
    @total
  end

end

private

  def list_items
     @menu.options.each do |item, price|
      @item = item
      @price = price.to_i
      select_item
    end
  end

  def select_item
    puts "How many of each #{@item} do you want"
    quant = gets.chomp.to_i
    @selected_items << {quant => @price}
  end

  def calculate
    total = 0
    @selected_items.each do | hash |
      hash.each_pair do | k, v | total += (k * v) end
    end
    total
  end

