class Order
  DISHES = [
    {id: "001", item: "Pepperoni Pizza", price: "7.99"},
    {id: "002", item: "Margherita Pizza", price: "7.49"},
    {id: "003", item: "Chips", price: "3.00"},
    {id: "004", item: "Onion Rings", price: "3.50"},
    {id: "005", item: "Diet Coke", price: "2.50"},
    {id: "006", item: "Fanta", price: "2.50"}
  ]

  def initialize
    @order_list = []
  end

  def print_menu
    puts "Menu:"
    puts "-----"
    DISHES.each do |item|
      puts "ID#{item[:id]} - £#{item[:price]} : #{item[:item]}"
    end
  end

  def order
    while true
      puts "Please enter the FULL ID number or 'end' to finish ordering: "
      order_id = gets.chomp
      break if order_id == 'end'
      order_item = DISHES.select { |item| item[:id] == order_id }
      puts "Please enter quantity of #{order_item[0][:item]}"
      order_quantity = gets.chomp
      @order_list.push([order_id, order_quantity])
    end
  end

  def print_order
    puts "Your Order:"
    puts ""
    @order_list.each { |each|
      order_select = Order::DISHES.select { |item| item[:id] == each[0]}
      puts "£#{((order_select[0][:price]).to_i * (each[1].to_i))} : #{each[1]} x #{order_select[0][:item]}"
    }
  end

  attr_reader :order_list
end
