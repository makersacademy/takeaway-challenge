class Menu

  attr_reader :dishes

  def initialize(dishes)

    @dishes = dishes

  end

  def view
    dishes.map { |dish , price | "#{dish} £#{price}" }.join(", ")
  end

 end