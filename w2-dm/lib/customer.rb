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
    raise "Incorrect amount stated" if incorrect_amount?
    @total = calculate
  end

  def confirm_order
    raise "Correct and complete your order" if incomplete?
    send_order
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

  def send_order
    phone = Phone.new
    phone.send_confirmation
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

  def incorrect_amount?
    !(@user_cost == calculate)
  end

  def incomplete?
    @total == 0
  end

