#displays a list of dishes with prices
require 'smarter_csv'
require 'words'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = parse
  end

  def display
    Words.menu_header
    dishes.each do |plate,price|
      puts "#{plate.capitalize}: £#{price}"
    end
    Words.line
  end

  private

  def parse
    data = SmarterCSV.process('./rubysushi.csv')
    dishes = {}
    data.each {|dish| dishes[dish[:plate]] = dish[:price]}
    dishes
  end

end
