#!/usr/bin/env ruby

require 'csv'
require './lib/menuitem'

class Menu
  attr_reader :items

  class << self
    def from_csv(path, menuitem_class = MenuItem, reader = CSV)
      self.new(get_items(path, menuitem_class, reader))
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
end
