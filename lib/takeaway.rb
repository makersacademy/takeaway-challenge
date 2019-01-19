require_relative 'menu'
require_relative 'text'

class Takeaway

  def initialize(name)
    @takeaway_name = name
    @menu = Menu.new(@takeaway_name + ".csv")
    @order =[]
    @sid = ENV['SID']
    @token = ENV['TOKEN']
    @takeaway_number = ENV['NUMBER']
  end

  def order(item, quantity = 1)
    @order << { item: item, quantity: quantity }
  end

  def show_order
    @order
  end

  def check_total(given_total)
    true if given_total == calculate_total
  end

  def complete_order
    @client_number = ENV['CLIENT']
    @sms = Text.new({ name: @takeaway_name, number: @takeaway_number, sid: @sid, token: @token })
    p @sms
    @sms.send_confirmation(@client_number)
  end

private

  def calculate_total
   @total = 0
   @order.each { |element| @total += (@menu.price?(element[:item]) * element[:quantity]) }
   @total
  end
end
