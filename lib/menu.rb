class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
                "spring roll"=>0.99,
                "char sui bun"=>3.99,
                "pork dumpling"=>2.99
              }
  end

  def print
    dishes.each do |item, price|
      "#{item.to_s.capitalize} is £#{sprintf('%.2f', price)}"
    end
  end
end
