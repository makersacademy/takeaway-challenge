class Menu

  def initialize
    @dishes = {Chicken: 3.78, Pasta: 4.59, Salad: 2.86 }
  end

  def show_dishes
    list = @dishes.map do|name, price|
      "#{name.to_s} £#{price.round(2)}"
    end

    list.join(" | ")
  end

end
