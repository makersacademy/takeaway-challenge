class Takeaway
  attr_reader :order, :order_total, :placed_order, :sum_of_dishes
  MENU = [
    { item: "Fish", price: 7 },
    { item: "Shish kebab", price: 7 },
    { item: "Kofta kebab", price: 6 },
    { item: "Pepperoni pizza", price: 8 },
    { item: "Steak pie", price: 3 },
    { item: "Small chips", price: 2 },
    { item: "Large chips", price: 3 },
    { item: "Salad", price: 3 },
    { item: "Coke", price: 2 },
    { item: "Tango", price: 2 },
    { item: "Irn Bru", price: 2 }
  ]
  def initialize
    @menu = MENU
  end

  def show_menu
    @menu.each do |menu_line|
      puts "#{menu_line[:item]}: £#{menu_line[:price]}"
    end
  end

  def place_order(order, order_total)
    @order = order
    @order_total = order_total
    @placed_order = { order: @order, order_total: @order_total }
    calc_sum_of_dishes
  end

  def calc_sum_of_dishes
    @sum_of_dishes = 0
    @order.split(",").each do |line|
      qty_and_item = line.split(/\W+/)
      qty = qty_and_item[0].to_i
      if qty_and_item.length == 3
        item = qty_and_item[-2] + " " + qty_and_item[-1]
      else
        item = qty_and_item[-1]
      end
      # Have to iterate over the hashes in menu
      # Use item to get price
      # Multiply price by qty
      price = 0
      @menu.each do |menu_line|
        price += menu_line[:price] if menu_line[:item].include?(item)
      end
      sum_of_item = price * qty
      @sum_of_dishes += sum_of_item
    end
  end

  def totals_equal?
    @order_total == @sum_of_dishes
  end
end
