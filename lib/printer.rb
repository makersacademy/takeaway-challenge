class Printer
  def display_bill(order_details,total)
    print_order(order_details) + print_total(total)
  end

  private
  def print_order(order_details)
    order_details.map.with_index(1){|detail,index| "#{index}. #{detail[:name].to_s.capitalize}\t#{detail[:quantity]} Qty\t£#{detail[:price]} EA"}.join("\n")
  end

  def print_total(total)
    "\nYour total is £%.2f." %total
  end
end
