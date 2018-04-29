class Option
  attr_reader :meals, :menu

  def initialize(menu = Menu.new)
    @meals = []
    @menu = menu
  end

  def add_option(selection, amount)
    @menu.menu.each do |dish|
      amount.times { @meals << dish if dish[:item] == selection }
    end
  end

  def total_options
    @meals.map { |dish| dish[:item_price] }.inject(:+)
  end

  def remove_option(selection, amount)
    new_meals = @meals.select { |dish| dish[:item] == selection }
    @meals.reject! { |dish| dish[:item] == selection }
    amount.times { new_meals.pop }
    @meals = @meals.concat new_meals
  end

  def basket
    meals = @meals.map { |dish| dish[:item] }
    meals.uniq.each { |dish| puts "x#{meals.count(dish)} of: #{dish}" }
    meals
  end
end
