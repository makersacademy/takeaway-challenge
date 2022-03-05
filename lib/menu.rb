class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      'bolognese' => 7.50,
      'carbonara' => 6.50,
      'puttanesca' => 5.50,
      'arrabiata' => 4.50
    }
  end

  def browse
    @dishes.each { |dish, price| puts "#{dish}: #{price}" }
  end
end
