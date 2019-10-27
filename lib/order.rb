# require 'menu'

class Order
  def initialize(menu)
    @basket = []
    @menu = menu.menu
  end

  def select(item_reference, quantity)
    quantity_i = quantity.to_i
    @menu.each do |item|
      if item[:ref] == item_reference
        charge = quantity_i * item[:price]
        line_item = { :ref => item[:ref], :name => item[:name], \
          :price => item[:price], :quantity => quantity, :charge => charge }
        @basket << line_item
      end
    end
    return @basket
  end

  def print
    @total_charge = 0
    output = "Uncle Ho's Ha Noi Cafe\n\nOrder\n\nRef\t\t\tQuantity\t\t"
    output += "\tName\t\t\t\tItem Price £\t\t\tCharge £\n"
    @basket.each do |item|
      output += "#{item[:ref]}\t\t\t#{item[:quantity]}\t\t\t\t#{item[:name]}"
      output += "\t\t\t#{item[:price]}\t\t\t\t#{item[:charge]}\n"
      @total_charge += item[:charge]
    end
    output += "Total cost is #{@total_charge}"
    return output
  end

  def check(customer_order, total)
    actual_total = 0
    @menu.each do |menu_item|
      customer_order.each do |customer_item|
        if customer_item[:ref] == menu_item[:ref]
          quant_ordered = customer_item[:quantity].to_i
          actual_total += (quant_ordered * menu_item[:price])
        end
      end
    end
    error_check(total, actual_total)
  end

  def error_check(total, actual_total)
    return fail "Error in order" unless total == actual_total
    return "OK"
  end

end
