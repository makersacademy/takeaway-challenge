require_relative 'takeaway'

class Menu

  attr_reader :options

  def initialize
    @options = {'Lamb Nihari' => 8.00, 'Haleem' => 9.00,
              'Chicken Karahi' => 6.00, 'Biryani' => 5.00}
  end

  def show
    @options.each {|item,price| puts "#{item}: £#{price}0"}
  end

  def available?(choice)
    @options.has_key?(choice)
  end

end
