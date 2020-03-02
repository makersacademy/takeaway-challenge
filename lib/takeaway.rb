class Takeaway
  attr_reader :dishes
  def initialize
  @dishes = {'Pizza' => 10, 'Pasta' => 9, 'Burger' =>  8}

  end

  def show_dishes
    @dishes.each {|dish, price| puts "#{dish} - £#{price}"}
  end
end
