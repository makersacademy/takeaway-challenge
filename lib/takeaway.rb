require_relative 'menu'
require_relative 'text'

class Takeaway

  SID = ENV['SID']
  TOKEN = ENV['TOKEN']
  TAKEAWAY_NUMBER = ENV['NUMBER']
  CLIENT_NUMBER = ENV['CLIENT']

  def initialize(name)
    @takeaway_name = name
    @menu = Menu.new(@takeaway_name + ".csv")
    @order = []
  end

  def order(item, quantity = 1)
    @order << { item: item, quantity: quantity }
  end

  def show_menu
    Printer.print_nicely(@menu.hashed_menu)
  end

  def show_order
    Printer.print_nicely(@order)
  end

  def check_total(given_total)
    true if given_total == calculate_total
  end

  def complete_order
    @sms = Text.new({
                     name: @takeaway_name,
                     number: TAKEAWAY_NUMBER,
                     sid: SID,
                     token: TOKEN
                     })
    @order = []
    @sms.send_confirmation(CLIENT_NUMBER)
  end

private

  def calculate_total
    @total = 0
    @order.each { |e| @total += (@menu.price?(e[:item]) * e[:quantity]) }
    @total
  end
end
