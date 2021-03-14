class Order
  def initialize(menu)
    @current_order = []
    @menu = menu
  end

  def add_to_order(item_number, quantity)
    item_order = { find_menu_item_by_number(item_number) => quantity }
    @current_order << item_order
    item_order
  end

  def remove_from_order(item_number, quantity)
    return "Cannot edit order by a negative number." if quantity < 1

    name = find_order_item_by_number(item_number)
    @current_order.each_with_index do |item, index|
      if item.has_key?(name)
        item[name] -= quantity
        @current_order.delete_at(index) if item[name] <= 0
      end
    end
    "Removed #{quantity} #{name} from order."
  end

  def display_current_order
    return "You have not selected any items." if empty?

    display_order_format
  end

  def current_cost
    total_cost(@current_order)
  end

  def empty?
    @current_order.empty?
  end

  private

  def find_menu_item_by_number(item_number)
    @menu.access[item_number - 1].flatten[0]
  end

  def find_order_item_by_number(item_number)
    @current_order[item_number - 1].flatten[0]
  end

  def find_price(item_name)
    @menu.access.each { |item| return item[item_name] if item.has_key?(item_name) }
  end

  def display_order_format
    display = ["YOUR ORDER\n"]
    @current_order.each_with_index { |item, index| display << order_line_format(item, index) }
    display.push("\nTOTAL: £#{total_cost(@current_order)}").join("\n")
  end

  def order_line_format(item, index)
    number = index + 1
    name = item.flatten[0]
    quantity = item.flatten[1]
    price = find_price(name)
    total = price * quantity

    "#{number}. #{name}  Price: £#{gbp_format(price)}  Qty: #{quantity}  Sub: £#{gbp_format(total)}"
  end

  def gbp_format(amount)
    sprintf('%<gbp>.2f', gbp: amount)
  end

  def total_cost(order)
    total = 0
    order.each do |item|
      name = item.flatten[0]
      quantity = item.flatten[1]
      price = find_price(name)
      total += quantity * price
    end
    gbp_format(total)
  end
end
