class Order
  attr_reader :contents, :summary

  def initialize
    @contents = []
  end

  def add(item, item_price, quantity = 1)
    if @contents.any? { |h| h[:item] == item }
      increase_order_quantity(item, quantity)
    else
      add_new_item(item, item_price, quantity)
    end
  end

  def increase_order_quantity(item, quantity)
    @contents[@contents.index { |h| h[:item] == item }][:quantity] += quantity
  end

  def add_new_item(item, item_price, quantity)
    new_addition = {
    :item => item,
    :quantity => quantity,
    :item_price => item_price
    }
    @contents << new_addition
  end

  def show_summary
    @summary = "here is your order\n"
    @contents.each { |i| @summary << "#{i[:item]} x#{i[:quantity]}  - £#{(i[:item_price]) * (i[:quantity])}\n" }
    total_amount = 0
    @contents.each { |i| total_amount += (i[:item_price] * i[:quantity]) }
    @summary << "\n----------\nOrder total is £#{total_amount}"
    puts @summary
  end
end
