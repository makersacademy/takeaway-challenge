class Menu
  attr_reader :menu
  def initialize(new_dishes = {})
    @menu = default_menu.merge(new_dishes)
  end

  def default_menu
    { flame_grilled_pheonix: 1200,
      sautéed_pineapple: 300,
      pickled_strawberry: 400 }
  end

  def list
    @menu.inject("") do |list, (dish, price)|
      price = format '%.2f', price / 100
      list << "#{dish}: £#{price}\n"
    end
  end
end
