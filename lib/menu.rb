require 'yaml'

class Menu
  attr_reader :items
  def initialize
    @items = YAML.load(File.open(File.dirname(__FILE__) + '/menu_items.txt' ) { |text| YAML::load(text ) })
  end

  def to_s
    items.each{|k,v| puts "#{k}: £#{v} \n"}
  end

  def get_price(item)
    items[item.to_sym.downcase]
  end
end
