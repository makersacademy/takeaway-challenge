require_relative 'order'
require 'messenger'


class Takeaway

  attr_reader :menu, :order, :messenger

  def initialize(menu:, order: nil, messenger: nil)
    @menu = menu
    @order = order || Order.new(menu)
    @messenger = messenger || Messenger.new
  end

  def show_menu
    menu.show
  end

  def place_order(options)
    options.each do |option, quantity|
      order.add(option, quantity)
    end
    messenger.deliver
    order.total
  end


end
