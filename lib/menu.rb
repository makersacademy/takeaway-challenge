class Menu
  attr_reader :menu, :pizza, :price

def initialize
@menu = [{:pizza => 'Margherita', :price => '8'},
{:pizza => 'Napolitana', :price => '10'},
{:pizza => 'Fiorentina', :price => '8.70'},
{:pizza => 'Funghi', :price => '9'},
{:pizza => 'Siciliana', :price => '9.50'},
{:pizza => 'American', :price => '7'},
{:pizza => 'Hawaiian', :price => '8.4'},
{:pizza => 'Vegetarian', :price => '9.2'},
{:pizza => 'Pollo', :price => '10'},
{:pizza => 'Carne', :price => '10.50'}]
end

def add_item(number)
  @added = @menu[number-1][:pizza]

end

end
