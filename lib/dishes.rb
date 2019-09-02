class Dishes
  attr_reader :dish_list

  def initialize
    @dish_list = {
      'Pizza' => 10,
      'Burger' => 5,
      'Sushi' => 20
    }
  end

  def list
    puts '-- Available dishes --'
    @dish_list.each_with_index do |(key, value), index|
      puts "#{index + 1} #{key} #{value} GBP"
    end
    puts '----------------------'
  end
end
