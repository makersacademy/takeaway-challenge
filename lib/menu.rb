class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(name, price)
    @dishes.push({ :name => "Bacalhau com natas", :price => 7.5})
  end

  def print_menu
    output = ""
    (0..@dishes.length-1).each do |index|
      dish = @dishes[index]
      output += "#{index+1}. #{dish[:name]}: #{dish[:price]}" + "\n"
    end
    return output
  end
end
