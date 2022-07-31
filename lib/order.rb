require_relative "bill"
require_relative "menu"
require_relative "order_confirmation"

class Order
  attr_reader :bill
  attr_reader :items

  def initialize(confirm = OrderConfirmation.new)
    @menu = Menu.new
    @bill = Bill.new
    @items = []
    @completed = false
    @confirm = confirm
  end

  def create
    select_item until completed?
    @confirm.send_text
  end

  def check_bill
    prices = @items.map { |item| item.price }
    fail "Bill is wrong" if @bill.total != prices.sum
  end

  private

  def completed?
    @completed
  end

  def select_item
    print @menu
    selection = gets.chomp

    if selection.empty?
      @completed = true
    else
      add_item(selection)
    end
  end

  def add_item(selection)
    item = @menu.select(selection)

    if item
      @items << item
      @bill.add(item.price)
    end
  end
end
