class Takeaway
  RESTURANT_NAME = "TAKEAWAY à la CHRIS\n"

  def initialize(menu_printer, sms)
    @orders = []
    @sent_messages = []
    @menu_printer = menu_printer
    @sms = sms
    @menu_labels = {name: "Description", category: "Category", price: 'Price'}
    @menu_items = [{name: 'pepperoni_pizza', category: 'Pizza', price: 12.99},
      {name: 'ham_and_mushroom_pizza', category: 'Pizza', price: 12.99},
      {name: 'cheese_pizza', category: 'Pizza', price: 10.99},
      {name: 'tex_mex_pizza', category: 'Pizza', price: 15.99},
      {name: 'wedges', category: 'Side', price: 4.99},
      {name: 'chicken_strippers', category: 'Side', price: 6.99},
      {name: 'garlic_dip', category: 'Side', price: 0.99},
      {name: 'bbq_dip', category: 'Side', price: 0.99},
      {name: 'coke', category: 'Drink', price: 2.99},
      {name: 'fanta', category: 'Drink', price: 2.99},
      {name: 'white_wine', category: 'Drink', price: 7.99},
      {name: 'red_wine', category: 'Drink', price: 7.99}]
  end

  def show_menu
    menu = @menu_printer.print_menu({headers: @menu_labels, items: @menu_items})
    how_to_order = "Please use the following comma seperated order format whether ordering directly or via text: '<item1>, <quantity>, <item2>, <quantity>, etc..., <total_price>, <long_format_phone_number>' "
    puts RESTURANT_NAME + menu + how_to_order
  end

  def place_order(order)
    raise 'Order not in correct format' if order.class != String
    raise 'Order not in correct format' unless order.match?(/(\A(\s*\w+, \d+,)+)(?= \d+\.*\d{2}*, \+44\d{10})/)
    interpret_order(order)
    check_total(@orders[-1])
    message = "Thank you! Your order was placed and will be delivered before #{(Time.now + 2700).strftime("%H:%M")}"
    @sent_messages << @sms.send(message, @orders[-1][:details][1])
    puts 'Order recieved, you should recieve a text confirmation shortly!'
  end

  private

  def interpret_order(order)
    order = order.scan(/[\w\.[^,]]+,[\w\.[^,]]+/).map{|item| item.split(',').map{|item| item.strip}}
    details = order.pop
    order.map!{|item| item = [item[0], item[1].to_f]}
    raise 'Item not on menu' unless order.all?{|item| @menu_items.any?{|o| o[:name] == item[0]}}
    details[0] = details[0].to_f
    @orders << {details: details, orders: [order]}
  end

  def check_total(order)
    order_total = order[:orders][-1].inject(0.to_f){|sum, item| sum + (@menu_items.find{|o| o[:name] == item[0]}[:price] * item[1])}
    customer_total = order[:details][0]
    raise 'Order total incorrect' if customer_total != order_total
  end
end
