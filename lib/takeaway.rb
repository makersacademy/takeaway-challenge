#!/usr/bin/env ruby

require_relative 'menu'
require_relative 'order'
require_relative 'orderparser'

class TakeAway
  attr_reader :menu, :parser

  MENU_CSV = './dishes.csv'

  def initialize(path: MENU_CSV, menu_class: Menu, parser: OrderParser.new)
    @menu = menu_class.from_csv(path)
    @parser = parser
  end

  def build_order(order, order_class: Order)
    Order.from_selection(@menu, @parser.to_hash(order))
  end

  def get_menu
    @menu.format
  end

  def place(order)
    begin
      build_order(order).format
    rescue ParseError
      @parser.get_errors(order)
    rescue DuplicateError
      @parser.get_duplicates(order)
    end
  end
end
