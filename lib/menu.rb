class Menu

  def initialize
    @dish = {
      "sushi" => 9,
      "noodles" => 8,
      "burger" => 7,
      "rice" => 6
    }
  end

  def list
    @dish.each {|item, price|
      puts "#{item} : £#{price}"}
  end
end
