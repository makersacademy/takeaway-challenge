#!/usr/bin/env ruby

require_relative 'dialogue'
require_relative 'menu'
require_relative 'numbers'
require_relative 'orderhandler'

class TakeAway
  attr_reader :menu, :orders

  DEFAULT_DELAY = 3600
  MENU_CSV = File.dirname(__FILE__) + '/../dishes.csv'

  def initialize(path: MENU_CSV, menu_class: Menu, numbers: Numbers.new,
                 dialogue: Dialogue.new, handler: OrderHandler
                )
    @menu = menu_class.from_csv(path)
    @dialogue = dialogue
    @handler = handler.new(menu)
    @numbers = numbers
    @orders = []
  end

  def print_menu
    menu.format
  end

  def response(number, order)
    order =~ /[YNyn]/ ? confirmation(number, order) : order(number, order)
  end

  def order(number, order)
    return @dialogue.in_progress if in_progress?(number)
    mark_in_progress(number)
    @handler.response(order)
  end

  def confirmation(number, message)
    return @dialogue.no_order unless in_progress?(number)
    mark_complete(number)
    respond(message)
  end

  def respond(message)
    message.downcase == 'y' ? confirm : cancel
  end

  def delivery(time_class: Time, delay: DEFAULT_DELAY)
    (time_class.now + delay).strftime('%H:%M')
  end

  private

  def confirm
    @dialogue.confirmed(delivery)
  end

  def cancel
    @dialogue.cancel
  end

  def in_progress?(number)
    @numbers.has?(number)
  end

  def mark_in_progress(number)
    @numbers.set(number)
  end
  
  def mark_complete(number)
    @numbers.clear(number)
  end
end
