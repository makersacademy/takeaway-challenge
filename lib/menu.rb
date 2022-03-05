class Menu

  def initialize
    @dishes = [
      { olives: 2.5 },
      { bruschetta: 5 },
      { pizza: 10 },
      { pasta: 12 },
      { risotto: 18 },
      { burger: 13 },
      { steak: 20 },
      { sole: 23 },
    ]
  end

  def list_dishes
    @dishes.each do |dish| 
      dish.each do |dish, price|
        puts "#{dish} £#{price}" 
      end
    end
  end
end
