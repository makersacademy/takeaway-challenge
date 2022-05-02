

class Menu

  attr_reader :dishes

  def initialize

    @dishes = {
      "Burger" => 5,
      "Chips" => 3,
      "Hot Dog" => 4,
      "Wings" => 3
    }

  end

  def view_dishes
    dishes.each { |item, price| p "#{item} £#{price}" }
  end

  def check_if_available(item)
    raise 'That dish is not available. Please select another dish.' if @dishes[item].nil?
  end
end
