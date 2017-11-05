#!/usr/bin/env ruby

require_relative 'dialogue'
require_relative 'menu'
require_relative 'orderhandler'

class TakeAway
  attr_reader :menu, :orders

  DEFAULT_DELAY = 3600
  MENU_CSV = './dishes.csv'

  def initialize(path: MENU_CSV, menu_class: Menu, 
                 dialogue: Dialogue.new, handler: OrderHandler
                )
    @menu = menu_class.from_csv(path)
    @dialogue = dialogue
    @handler = handler.new(menu)
    @orders = []
  end

  def print_menu
    menu.format
  end

  def incoming_order(number, order)
    return @dialogue.in_progress if in_progress?(number)
    mark_in_progress(number)
    @handler.response(order)
  end

  def incoming_confirmation(number, message)
    return @dialogue.no_order unless in_progress?(number)
    mark_complete(number)
    respond(message)
  end

  def respond(message)
    message.downcase == 'y' ? confirm : cancel
  end

  def delivery(time_class: Time, delay: DEFAULT_DELAY)
    (time_class.now + delay).strftime('%H:%M:%S')
  end

  private

  def confirm
    @dialogue.confirmed(delivery)
  end

  def cancel
    @dialogue.cancel
  end

  def in_progress?(number)
    orders.include?(number)
  end

  def mark_in_progress(number)
    orders << number
  end
  
  def mark_complete(number)
    orders.delete(number)
  end
end
