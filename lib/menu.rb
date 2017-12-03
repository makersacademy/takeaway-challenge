class Menu

attr_reader :dishes

  def initialize
    @dishes = { Chicken: 3.78, Pasta: 4.59, Salad: 2.86 }
  end

  def show_dishes
    list = @dishes.map do |name, price|
      "#{name} £#{price.round(2)}"
    end

    list.join(' | ')
  end

end
