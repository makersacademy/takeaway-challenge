#displays a list of dishes with prices

class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"edamame" => 2, "kaiso" => 4, "maki" => 4, "nigiri" => 3}
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

end
