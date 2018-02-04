require_relative "menu"
require_relative "bill"

class Takeaway
  attr_reader :menu, :bill

  def initialize(menu = Menu.new, bill = Bill.new)
    @menu = menu
    @bill = bill
  end

  def show_menu
    @menu.show
  end

  def confirm_order
    time = Time.now + 3600
    @bill.send_bill("Thank you! Expect your order at #{time.strftime("%k:%M")}")
  end
end
