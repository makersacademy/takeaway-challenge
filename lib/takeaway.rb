require './lib/customer.rb'
require './lib/menu.rb'
require './lib/sms.rb'

class Takeaway
  include SMS

  def initialize(menu = Menu.new, customer = Customer.new)
    @menu = menu
    @customer = customer
  end

  def show_menu
    @menu.items.each_pair do |item_number, item|
      puts "#{item_number}. #{item[:name]}: £#{item[:cost]}\n"
    end

    puts
  end

  def show_order
    @menu.items.keys.each do |k|
      print_order_item(k) if @customer.order[:items].include?(k)
    end
    
    print_order_total
  end

  def add_to_order(item_number, quantity)
    quantity.times do
      @customer.order[:items] << item_number
      @customer.order[:total_cost] += @menu.items[item_number][:cost]
    end
  end

  def checkout
    check_total
    clear_order
    send_confirmation
  end

  private

  def check_total
    item_sum = @customer.order[:items].reduce(0) do |sum, item|
      sum + @menu.items[item][:cost]
    end

    raise 'Accounting error' unless item_sum == @customer.order[:total_cost]
  end

  def clear_order
    @customer.order = { items: [], total_cost: 0 }
  end

  def confirmation_string
    "Thanks for ordering! Your meal will be delivered by #{hour_hence}"
  end

  def hour_hence
    now = DateTime.now
    "%<hr>02d:%<mn>02d" % { hr: now.hour.next, mn: now.minute.next }
  end

  def print_order_item(num)
    print "\n#{@customer.order[:items].count(num)} x "
    print "#{@menu.items[num][:name]}"
  end

  def print_order_total
    puts "\n£#{@customer.order[:total_cost]}\n\n"
  end

  def send_confirmation
    SMS.send(confirmation_string)
  end
end
