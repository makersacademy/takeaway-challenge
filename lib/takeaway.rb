class Takeaway

  attr_reader :menu

  def initialize
    @menu = {
              "prawn crackers"=>2.00,
              "summer roll"=>4.50,
              "spring rolls"=>3.99,
              "pho"=>10.99,
              "bun thit nuong"=>9.50,
              "seafood stir fry"=>13.99,
              "coke"=>1.50,
              "water"=>1.25
            }
  end

  def read_menu
    @menu.each do |item, price|
      puts "#{item.split.map(&:capitalize).join(" ")}: £#{sprintf("%.2f", price)}"
    end
  end
end
