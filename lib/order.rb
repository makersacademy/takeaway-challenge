class Order

  def initialize(menu_list, customer_name)
    @menu_list = menu_list
    @customer_name = customer_name
    @order_summary = []
  end

  def add_items(item, quantity)
    @item, @quantity = item, quantity
    raise "We didn't recognise that, try again" unless item_exists?
    @order_summary << item_info
    puts "#{quantity}x #{item.upcase} added"
  end

  def display_order_summary
    puts "Thank you. We're just fetching your order summary..."
    present_summary
    puts "Your total is: £#{sprintf('%.2f', calculate_total)}"
  end

  def item_exists?
    @menu_list.any? {|hash| hash[:dish].upcase == @item.upcase }
  end

  def item_info
    @menu_list.select { |hash| hash[:quantity] = @quantity if hash[:dish].upcase == @item.upcase }
  end

  def present_summary
    @order_summary.each do |item|
      puts "#{item[0][:dish].upcase} x #{item[0][:quantity]} = #{item[0][:price].to_f * item[0][:quantity].to_f}"
    end
  end

  def calculate_total
    @order_summary.inject(0) do |sum, hash|
      sum + (hash[0][:price].to_f * hash[0][:quantity].to_f)
    end
  end

end
