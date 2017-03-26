#displays a list of dishes with prices
require 'smarter_csv'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = parse
  end

  def display
    puts "--------------"
    puts "Todays's Menu:"
    puts "--------------"
    dishes.each do |k,v|
      puts "#{k.capitalize}: £#{v}"
    end
    puts "--------------"
  end

  private

  def parse
    data = SmarterCSV.process('./rubysushi.csv')
    dishes = {}
    data.each {|v| dishes[v[:plate]] = v[:price]}
    dishes
  end

end
