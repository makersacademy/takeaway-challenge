class Menu
  attr_reader :options

  def initialize
    @options = { :Pizza => 10, :Chips => 5, :Fish => 12, :Salad => 9, :Burger => 9 }
  end

  def print
    @options
    print_options
  end

  private

  def print_options
    @options.each do |item, price| puts "#{item} = #{price}" end
  end

end

