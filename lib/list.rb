
class List

attr_reader :dishes

  def initialize
    @dishes = {lasagna: 4.50, pizza: 7.50, steak: 17.50}
  end

  def show_dishes
    @dishes.map { |name, price| "#{name.to_s} £#{price}" }.join(" | ")
  end

end
