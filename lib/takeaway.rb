#!/usr/bin/env ruby

require_relative 'dialogue'
require_relative 'menu'
require_relative 'order'
require_relative 'orderparser'

class TakeAway
  attr_reader :menu, :orders

  MAX_WAITING_TIME = 3600
  MENU_CSV = './dishes.csv'

  def initialize(path: MENU_CSV, menu_class: Menu, 
                 parser: OrderParser.new, dialogue: Dialogue.new
                )
    @menu = menu_class.from_csv(path)
    @parser = parser
    @dialogue = dialogue
    @orders = []
  end

  def build_order(order, order_class: Order)
    order_class.from_selection(@menu, @parser.to_hash(order))
  end

  def print_menu
    menu.format
  end

  def incoming_order(number, order)
    return @dialogue.in_progress if in_progress? number
    begin
      object = build_order(order)
      place(number, object)
    rescue ParseError
      @dialogue.malformed(order)
    rescue DuplicateError
      @dialogue.duplicated(order)
    rescue RangeError
      @dialogue.missing(object)
    end
  end

  def place(number, order)
    mark_in_progress(number)
    @dialogue.confirm? order
  end

  def confirm(number, msg)
    return @dialogue.no_order unless in_progress? number
    mark_complete(number)
    is_y?(msg) ? @dialogue.confirmed(delivery) : @dialogue.cancelled
  end

  private

  def in_progress?(number)
    orders.include? number
  end

  def mark_in_progress(number)
    orders.push number
  end
  
  def mark_complete(number)
    orders.delete number
  end

  def is_y?(message)
    message.downcase == 'y'
  end

  def delivery
    Time.now + MAX_WAITING_TIME
  end
end
