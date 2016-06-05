class Display

  order_title = "Order Summary\n#{ "="*60 }\nDish#{ " "*32 }  Price   Qty"\
                "      Total\n" + "-"*60 + "\n"
  menu_title =  "Menu\n#{ "="*40 }\nDish#{ " "*30 } Price\n" + "-"*40 + "\n"

  def self.order_summary(order, menu)
    order_title + order_list(order,menu) + order_footer(order,menu)
  end

  def self.order_list(order,menu)
    output = ""
    order.items.each do |item, qty|
    output +=
      "#{ item.ljust(36) } £#{ format("%.2f",price(item, menu)).rjust(5) } "\
      "#{ qty.to_s.rjust(5) }   £#{ format("%.2f",price(item, menu)*qty).rjust(7) }\n"
    end
    output
  end

  def self.order_footer(order,menu)
    "="*60 + "\n"\
    "Total cost: £#{ format("%.2f",total_price(order,menu)).rjust(7) }".rjust(60)
  end

  def self.order_title
    "Order Summary\n#{ "="*60 }\nDish#{ " "*32 }  Price   Qty"\
    "      Total\n" + "-"*60 + "\n"
  end

  def self.price(item,menu)
    menu.price(item)
  end

  def self.total_price(order,menu)
    order.items.inject(0) { |total, entry| total += price(entry[0])*entry[1]}
  end
end
