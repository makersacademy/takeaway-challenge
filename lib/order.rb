require_relative 'menu.rb'
require_relative 'message_sender.rb'

class Order

  attr_reader :in_progress

  MENU = Menu::MENU

  def initialize
    @in_progress = Hash.new(0)
    @breakdown = Hash.new
    @confirmation_message = MessageSender.new
  end

  def add_item(item, count=1)
    raise "Error: #{item} not found on menu" if item_not_on_menu?(item.to_sym)
    @in_progress[item.to_sym] += count
    @in_progress
  end

  def price
    total = 0
    @in_progress.each_pair do | item, count|
      total += count * MENU[item]
    end
    "£#{total}"
  end

  def breakdown
    @in_progress.each_pair do |item, count|
      @breakdown[item] = "#{count}x £#{MENU[item]}"
    end
    @breakdown
  end

  def confirm(number)
    raise "Error: Nothing in your order!" if order_empty?
    "#{@in_progress} will be #{price}"
    @confirmation_message.send_message(number, "Thank you! Your order was placed and will be delivered by #{delivery_time}")
  end

  private

  def item_not_on_menu?(item)
    !MENU.key?(item)
  end

  def order_empty?
    @in_progress == {}
  end

  def delivery_time
    hour = Time.new.hour + 1
    min = Time.new.min
    min = "0#{min}" if min < 10
    "#{hour}:#{min}"
  end


end
