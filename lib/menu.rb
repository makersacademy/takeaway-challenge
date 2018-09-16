class Menu
  attr_reader :menu
  attr_accessor :ordered_dishes

  def initialize
    @menu = [
      { dish: 'pasta', price: 10.00, category: 'main_nonveg_meal' },
      { dish: 'chickenwings', price: 20.00, category: 'main_nonveg_meal' },
      { dish: 'fries', price: 2.00, category: 'main_nonveg_meal' },
      { dish: 'beefburger', price: 5.00, category: 'main_nonveg_meal' }
    ]
  end

  def show_menu
    # @menu = @menu.map { |item| puts item.values }
    @menu.each do |item|
      item.each do |value|
        print "#{value}"
      end
      puts
    end
  end

  def select_dishes
    @ordered_dishes = @menu.sample(3)
    @ordered_dishes.each { |item| item[:quantity] = 0 }
    @ordered_dishes = @ordered_dishes.select { |item| item[:quantity] = rand(0..5)}
      .select { |k| k.delete(:category) }
    @ordered_dishes
  end

end
