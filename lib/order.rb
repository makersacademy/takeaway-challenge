require_relative './takeaway'

class Order 
  attr_reader :order_list, :takeaway

  def initialize(takeaway = Takeaway.new)
    @order_list = []
    @takeaway = takeaway
  end

  def add_item(item)
    @order_list.append(item)
  end

  def add_by_name(name)
    @takeaway.menu_hash.each do |item_name, price|
      if name == item_name
        add_item({ item_name => price })
      end
    end
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
end