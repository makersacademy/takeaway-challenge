require_relative 'order'

class Takeaway

  attr_accessor :active_order, :order_items, :menu_item, :kitchen, :cooking

    def initialize
      @kitchen = Kitchen.new
        menu
    end

    def menu

      #displays the menu

      @menu_item = [
        {id: 1, name: 'Dish 1', price: 6.50},
        {id: 2, name: 'Dish 2', price: 8.50},
        {id: 3, name: 'Dish 3', price: 8.00} ]

      puts "============================== MENU =============================="

      puts "#{@menu_item[0][:id]}. #{@menu_item[0][:name]}.........#{@menu_item[0][:price]}"
      puts "#{@menu_item[1][:id]}. #{@menu_item[1][:name]}.........#{@menu_item[1][:price]}"
      puts "#{@menu_item[2][:id]}. #{@menu_item[2][:name]}.........#{@menu_item[2][:price]}"

      @menu_item.each do | key, value |
        puts key
        end
    end

    def create_order(name)
      @active_order = Order.new(name)
    end

    def test_method(dish_id)

      chosen_dish = @menu_item.select {|dish| dish[:id] == dish_id}

      dish = chosen_dish.pop

      puts "1x #{dish[:name]} has been added to your order"

      @active_order.order_items << dish

      # if @active_order.order_items.length == 1
      #
      #   total = @active_order.order_items[0][:price]
      #
      #   puts "Your current order total is £#{total}"
      #
      # elsif @active_order.order_items.length > 1

          # total = @active_order.order_items[0][:price] + @active_order.order_items[1][:price]

          sum = @active_order.order_items.map {|s| s[:price]}.reduce(0, :+)

          puts "There are currently #{@active_order.order_items.length} items in your order."
          puts "Your current order total is £#{sum}"
          puts ""
          puts "To checkout, complete your order (.complete)"
          puts "To start over, clear your order (.empty_cart)"

      end

    def empty_cart
      @active_order.order_items.clear
    end

    # def populate_order(user_input)
    #   # @active_order.order_items << @menu_item.select{|key, hash| hash[:id] == user_input }
    #
    #   @active_order << @menu_item.select{|dish| dish[:id] == user_input }
    #
    # end

    def submit_order
      @kitchen.cooking << @active_order
    end
 end

class Kitchen

  attr_accessor :cooking, :orders_processed

  def initialize
    @cooking = []
    @orders_processed = 0
  end

  #when an item is added to the @cooking array, a message sends to the customer

  def send_message
    if @cooking.length > @orders_processed
      puts "Message to customer: Your order was placed at #{Time.now} will be delivered in an hour."
      @orders_processed = @orders_processed + 1
    end
  end

end
