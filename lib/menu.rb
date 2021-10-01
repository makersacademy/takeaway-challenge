class Menu
  attr_reader :dishes

  def initialize(dishes = { "pepperoni" => 8, "veggie" => 8, "hawaiian" => 9, "bbq chicken" => 10 })
    @dishes = dishes
  end

  def print
    dishes.each do |item, value|
      puts "#{item}: £#{value}"
    end
  end
