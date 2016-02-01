require_relative 'order'

class Menu
  attr_reader :menu, :dishes
  attr_accessor :duplicate_menu
  def initialize
    @dishes = {}
    @dishes['Soup'] = 2
    @dishes['Bread_Roll'] = 2
    @dishes['Scones'] = 1
    @dishes['Sandwich'] = 3
  end

  def duplicate_menu
    @dishes.dup
  end

  def read_menu
    @dishes.each do |k, v|
      puts "#{k} costs £#{v}"
    end
  end
end
