class Menu

  attr_reader :list

  def initialize
    @list = {"Chicken"=>5, "Fish"=>7, "Lamb"=>6, "Vegan"=>5}
  end

  def see
    @list.each do |dish, price|
      puts "#{dish}: #{price}"
    end
  end
end
