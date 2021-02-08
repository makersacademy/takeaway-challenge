require_relative './takeaway'

class Order 
  attr_reader :order_list, :takeaway

  def initialize(takeaway = Takeaway.new)
    @order_list = []
    @takeaway = takeaway
  end

  def add_by_name(name)
    @takeaway.menu_hash.each do |item_name, price|
      if name == item_name
        add_item({ item_name => price })
      end
    end
  end

  def print_current_order
    total = 0
    @order_list.each do |item|
      puts "#{item.keys.first} : £%.2f" % item.values.first
      total += item.values.first
    end
    puts "Total : £%.2f" % total
  end

  def interactive_menu
    while true
      item_name = gets.chomp
      if item_name == 'stop'
        break
      else
        add_by_name(item_name)
      end
    end
  end

  def confirm_order
    time = Time.now + 60 * 60
    print_current_order
    puts "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}"
  end
  private 

  def add_item(item)
    @order_list.append(item)
  end
end