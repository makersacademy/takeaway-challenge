class Order

attr_reader :order, :total

  def initialize(menu)
    @menu = menu
    @order = []
  end

  def add_items(item, quantity)
    @item, @quantity = item, quantity
    raise "We didn't recognise that, try again" unless item_exists?
    @order << item_info
    "#{@quantity}x #{@item.upcase} added"
  end

  def display_order_summary
    puts "Thank you. We're just fetching your order summary..."
    present_summary
    @total = calculate_total
    "Your total is: £#{sprintf('%.2f', @total)}"
  end

  def calculate_total
    @order.inject(0) do |sum, hash|
      sum + (hash[0][:price].to_f * hash[0][:quantity].to_f)
    end
  end

  private

  def item_exists?
    @menu.any? {|hash| hash[:dish].upcase == @item.upcase }
  end

  def item_info
    @menu.select { |hash| hash[:quantity] = @quantity if hash[:dish].upcase == @item.upcase }
  end

  def present_summary
    @order.each do |item|
      puts "#{item[0][:dish].upcase} x #{item[0][:quantity]} = #{item[0][:price].to_f * item[0][:quantity].to_f}"
    end
  end



end
