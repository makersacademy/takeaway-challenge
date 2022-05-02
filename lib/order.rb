 class Order

  attr_reader :current_order, :printed_order, :menu

  def initialize(restaurant)
    @current_order = []
    @printed_order = ""
    @menu = Menu.new(restaurant)
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

  private

  def format_order
    @current_order.each do |selection|
      selection.each { |item, price| @printed_order << "#{item}, £#{price}\n" }
    end
    @printed_order.chomp
  end
 end