 class Order

  attr_reader :current_order, :printed_order, :menu

  def initialize(restaurant)
    @current_order = []
    @printed_order = ""
    @menu = Menu.new(restaurant)
  end

  def add(item)
    @current_order << item
  end

  def view_order
    if current_order.empty?
      @printed_order
    else
      @current_order.each do |selection|
        selection.each { |item, price| @printed_order << "#{item}, £#{price}\n" }
      end
      @printed_order.chomp
    end
  end 
 end