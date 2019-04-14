class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      edamame: 4,
      chilli_squid: 6,
      duck_wraps: 6,
      steamed_bun: 4,
      chicken_ramen: 10,
      seafood_ramen: 12,
      yasai_ramen: 10
    }
  end

  def list
    @dishes.map do |name, price|
      "#{name.to_s.split("_").map(&:capitalize).join(" ")}: £#{price}"
    end.join(", ")
  end
end
