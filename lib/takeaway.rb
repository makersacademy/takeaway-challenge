# frozen_string_literal: true

require 'csv'
require_relative 'dish'

class Takeaway
  attr_reader :menu

  def initialize(menu_file_path)
    @menu = read_menu_file(menu_file_path)
  end

  def read_menu_file(menu_file_path)
    menu_items = []
    CSV.foreach(menu_file_path, headers: true, converters: [:numeric]) do |row|
      menu_item = row.to_h
      menu_items << Dish.new(menu_item['name'], menu_item['price'])
    end
    menu_items
  end
end
