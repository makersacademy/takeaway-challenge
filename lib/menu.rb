class Menu
  def initialize
    @dishes = {
      marinara: "£5.50",
      margherita: "£6.50",
      pepperoni: "£8",
      capricciosa: "£10",
      bufala: "£11"
    }
  end

  def list_dishes
    @dishes.each do |dish, price|
      puts "#{dish} #{price}"
    end
  end
end