require_relative 'restaurant'
require_relative 'item'
require 'yaml'

class Menu

attr_reader :items

def initialize(filename = 'menu.yml')
  @items = YAML.load_file(filename)
  puts items.inspect
  @items.map! { |hash| Item.new(hash) }
end

def select_by_name(name)
  @items.select{ |item| item.name == name }.first
end

def check
  @items
end


end
