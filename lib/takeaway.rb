#!/usr/bin/env ruby

require 'sinatra'
require_relative 'menu'
require_relative 'order'
require_relative 'orderparser'

module TakeAway
  MENU_CSV = './dishes.csv'

  def parse_order(order, parser: OrderParser.new)
    item_hash = parser.parse(order) 
  end

  def menu(path: MENU_CSV, menu_class: Menu)
    menu_class.from_csv(path)
  end




end
