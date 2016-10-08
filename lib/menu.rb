require 'csv'

class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def read_menu(file)
    keys = ['dish', 'price']
    @menu = CSV.read(file).each {|arr| Hash[ keys.zip(arr) ]}
  end

  def print_menu
    @menu.each do |array|
      puts array.join
    end
  end
end
