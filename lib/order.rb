class Order

  attr_reader :current_order, :printed_order, :menu

  def initialize(restaurant)
    @current_order = []
    @printed_order = ""
    @menu = Menu.new(restaurant)
    @total = 0
  end

  def add(item)
    @menu.csv_to_hash if @menu.menu_hash.empty?
    fail "Input error: This item is not on the menu." unless @menu.menu_hash.key?(item)
    @current_order.push({item => @menu.menu_hash[item]})
  end

  def remove(item)
    fail "User error: No items in current order." if @current_order.empty?
    array_item = {item => @menu.menu_hash[item]}
    fail "Input error: Item not in current order." unless @current_order.include? array_item
    i = current_order.find_index(array_item)
    @current_order.delete_at(i)
  end

  def view_order
    @printed_order = ""
    if current_order.empty?
      @printed_order
    else
      format_order
    end
  end 

  def order_total
    @total = 0
    calculate_total
    return "£#{'%.2f' % @total}"
  end

  # def confirm_order(number, acc_sid, a_token)
  #   # method required to send order to restaurant
  #   sms = Text.new(number, acc_sid, a_token)
  # end

  private

  def format_order
    @current_order.each do |selection|
      selection.each { |item, price| @printed_order << "#{item}, £#{price}\n" }
    end
    @printed_order.chomp
  end

  def calculate_total
    @current_order.each do |selection|
      selection.each { |item, price| @total += price.to_f }
    end
  end

 end