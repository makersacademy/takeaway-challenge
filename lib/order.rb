require_relative 'menu.rb'

class Order

  DELIVERY_TIME = 3600 #3600 = 1 Hr

  attr_reader :menu,:basket,:order_qty,:bill_total,:sms_message

  def initialize
    @menu = Menu.new
    @basket = {}
    @bill_total = []
    @order_due_time
    @order_time
    @order_qty = 0
    @sms_message = ""
    order_items = []
  end


  def place_order(customer_order)
    clear_order
    order_time
    order_due_time
    create_order(customer_order)
    calculate_bill
    check_order_value(customer_order)
    create_sms_message
  end



  def add_food(item)
    message = ("Sorry, #{item} isn't on the menu")
    if !item_on_menu?(item)
      clear_order
      raise message
    end
    add_items_to_basket(item)
  end


  def basket_summary
    "#{@basket.to_a.join(" ")} Total: £#{bill_total}"
  end

  def order_due_time
    time = Time.new
    time += DELIVERY_TIME
    min = "%02d" % time.min
    @order_due_time = "#{time.hour}:#{min}"
  end

  def order_time
    time = Time.new
    min = "%02d" % time.min
    @order_time = "#{time.hour}:#{min}"
  end


  private

  def create_sms_message
    @sms_message = ("Thanks for your order of #{order_qty} items:\n\n#{basket.map{|k,v| "#{k} x #{v}"}.join(", ")}\n\nThe charge is £#{bill_total} and will be delivered before #{order_due_time}")
  end

  def add_items_to_basket(item)
    basket[item] == nil ? basket[item] = 1 : basket[item] += 1
  end

  def calculate_bill
    @bill_total = @bill_total.reduce(:+)
  end

  def check_order_value(customer_order)
    message = "Sorry, you have provide the wrong amount of money"
    if customer_order.split("=£")[1].to_i != @bill_total
      clear_order
      raise message
    end
  end

  def clear_order
    @basket = {}
    @bill_total = []
    @order_qty = 0
    order_items = []
  end

  def create_order(customer_order)
    order_items = customer_order.split("=£")[0].split(",")
    order_items.each_index do |i|

      if i.odd?

        order_items[i].to_i.times do
          @order_qty += 1
          add_food(order_items[i-1])
          @bill_total << @menu.menu[order_items[i-1]]
        end

      end

    end


  end

  def item_on_menu?(item)
    @menu.menu.has_key?(item)
  end

end
