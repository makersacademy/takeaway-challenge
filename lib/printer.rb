module Printer

  def self.menu_printer(menu)
    counter = 1
    menu.map do |dish, price|
       puts "#{counter}. #{dish.to_s}: £#{price.to_s}0"
       counter += 1
    end
  end

  def self.receipt_printer(order)
    order.selection.each do |pair|
      puts "#{pair[0].to_s}: £#{pair[1]}0"
    end
    puts "Total: £#{order.total}0"
  end

end
