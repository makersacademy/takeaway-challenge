require_relative 'order'

class Menu
  attr_reader :menu, :dishes
  def initialize
    @dishes = {"Soup": 2      ,
              "Bread_roll": 2,
              "Scones": 1    ,
              "Sandwich": 3  ,
              }
  end

  def read_menu
    @dishes.each do |k, v|
      puts "#{k} costs £#{v}"
    end
  end
end
