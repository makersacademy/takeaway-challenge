require 'menu'
require 'order'
require 'sms'

class Takeaway
  def initialize(config)
    @menu = config.fetch(:menu, Menu.new)
    @sms = config.fetch(:sms, SMS.new)
    @order = config.fetch(:order, Order.new(sms))
  end

  private

  attr_reader :menu, :order, :sms
end
