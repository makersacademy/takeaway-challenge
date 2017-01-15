
class List

attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes
  end

  def show_dishes
    @dishes.map { |name, price| "#{name.to_s} £#{price}" }.join(" | ")
  end

end
