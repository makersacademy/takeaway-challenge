#!/usr/bin/env ruby

require 'csv'
require './lib/menuitem'
require './lib/formats'

class Menu
  attr_reader :items

  class << self
    def from_csv(path, menuitem_class = MenuItem, reader = CSV)
      new(get_items(path, menuitem_class, reader))
    end

    private

    def get_items(path, menuitem_class, reader)
      reader.foreach(path).map do |title, price| 
        menuitem_class.new(title, price)
      end
    end
  end

  def initialize(items)
    @items = items
  end

  def get(index)
    @items[index]
  end

  def format(formatter = MenuFormat.new, *args)
    items.each_with_index.map do |item, index| 
      formatter.format(index, item, *args)
    end.join("\n")
  end
end
