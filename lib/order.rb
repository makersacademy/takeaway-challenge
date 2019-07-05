

class Order

  def initialize
    @order_log = []
    @order_total = 0
    @order_complete = false
  end

  def add_item(takeaway)
    selection(takeaway)
  end

  def order_total
    @order_total
  end

  def selection_header
    puts "To view menu type 'menu'"
    puts "To end order type 'end'"
  end

  def order_complete?
    @order_complete
  end

  private

  def sum_order(item, takeaway)
    @order_total += takeaway.menu[item.to_sym]
  end

  def selection(takeaway, user_gets = )
    puts "Please enter selection from menu:"
    item = gets.chomp.downcase.split(' ').join('_')
    if takeaway.menu.key?(item.to_sym)
      add_item_log(item, takeaway)
    elsif item == 'menu'
      puts takeaway.view_dishes
    elsif item == 'end'
      puts 'Thank you, order finished'
      puts "Your total will be £#{@order_total}"
      @order_complete = true
    else
      puts "Item not on menu, please make another selection:"
    end
  end

  def add_item_log(item, takeaway)
    @order_log << item
    sum_order(item, takeaway)
    puts "Total cost now £#{@order_total}"
  end

end
