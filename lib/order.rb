require_relative "./item_list.rb"
class Order
  include ItemList

  def initialize
    @items =[]
  end
  def add_order_items(dish, amount)
    amount.times do
      add_item(dish)
    end
  end

  def remove_order_items(dish, amount)
    amount.times do
      remove_item(dish)
    end
  end

  def display
    oh = order_hash()

    display_header()

    oh.each do |item, accumulation|
      display_row(item.name, item.cost, accumulation[:amount], accumulation[:total_cost])
    end

    display_footer(total())
    return
  end

  def total
    items.reduce(0) { |total, item| total + item.cost }
  end

  private

  def display_header
    puts "- Current Order -------------------------------------"
    puts " Dish Name            |    Price | Amount |    Total "
    puts "-----------------------------------------------------"
  end

  def display_row(name, price, amount, total_cost)
    puts " %-20s | %8s | %6s | %8s " % [name, "£" + "%.2f" % price, amount, "£" + "%.2f" % total_cost]
  end

  def display_footer(total)
    puts "-----------------------------------------------------"
    puts " Total Cost: %39s " % ["£%.2f" % total]
    puts "-----------------------------------------------------"
  end

  def order_hash
    order_hash_new = Hash.new
    items.each do |item|
      order_hash_new[item] ||= { amount: 0, total_cost: 0 } # unless order_hash[item]
      order_hash_new[item][:amount] += 1
      order_hash_new[item][:total_cost] += item.cost
    end
    order_hash_new
  end

end
