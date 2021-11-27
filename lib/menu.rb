class Menu 
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def show
    @dishes.each do |dish|
      dish.each { |name, price| puts "#{name} - £#{price}" }
    end
  end
end