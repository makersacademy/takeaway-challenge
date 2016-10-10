require_relative 'restaurant'
require_relative 'item'
require 'yaml'

class Menu

attr_accessor :items

def initialize(filename = 'menu.yml')
  @items = YAML.load_file(filename)
  @items.map! { |hash| Item.new(hash) }
end

def select_by_name(name)
  @items.select{ |item| item.name.downcase == name.downcase }.first
end

def check
  fail "Menu empty" if items.empty?
  @items
end


end
