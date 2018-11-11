class Menu

  attr_reader :list

  def initialize(list = [
    { :item => 'Beef Burrito', :price => 8 },
    { :item => 'Chicken Burrito', :price => 7 },
    { :item => 'Pork Enchiladas', :price => 6 },
    { :item => 'Beef Chimichunga', :price => 9 },
    { :item => 'Mixed Fajita', :price => 9 }
    ])
    @list = list
  end

  def view
    @list
  end

end
