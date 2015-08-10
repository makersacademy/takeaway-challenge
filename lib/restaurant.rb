#require 'terminal-table'
require 'twilio-ruby'
require './lib/sms.rb'

class Restaurant

  def initialize #smsclass <= suggested by peer
    @menu = {margherita: 5, pepperoni: 6, hawaiian: 6, supreme: 7}
    @selected = {}
    #@sms = smsclass.new <= suggested by peer review
  end

  def choose(amount, dish)
    raise "Your choice is not on the menu" unless menu.include?(dish.to_sym)
    selected.store(dish.to_sym, amount)
  end

  def total_price
    total = margherita_subtotal + pepperoni_subtotal + hawaiian_subtotal + supreme_subtotal
  end

  def place_order(expected_total)
    raise "Your expected amount does not match the total price for the selected dishes" if expected_total != total_price
    send_sms
  end

  def send_sms
    #@sms <= suggested by peer
    Sms.new.send_text
  end

  def margherita_subtotal
    selected[:margherita] ? menu[:margherita] * selected[:margherita] : 0
  end

  def pepperoni_subtotal
    selected[:pepperoni] ? menu[:pepperoni] * selected[:pepperoni] : 0
  end

  def hawaiian_subtotal
    selected[:hawaiian] ? menu[:hawaiian] * selected[:hawaiian] : 0
  end

  def supreme_subtotal
    selected[:supreme] ? menu[:supreme] * selected[:supreme] : 0
  end

  attr_reader :menu, :selected
end
