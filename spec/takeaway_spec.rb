require './lib/takeaway.rb'
describe Takeaway do

  let(:dish_double) { double :dish, menu_number: 1, dish_name: 'Chicken Tikka', dish_cost: 5 }
  let(:menu_double) { double :menu, dishes: [dish_double] }
  
  describe '#show_menu' do
    before :each do
      @takeaway = Takeaway.new(menu_double)
    end
    it 'Returns a menu when asked' do
      expect { @takeaway.show_menu }.
      to output("Hello, Here is a list of our tasty food\n"\
      "Menu Number: #{dish_double.menu_number}, Name: #{dish_double.dish_name},"\
      " Price: #{dish_double.dish_cost}\n").to_stdout
    end
  end
end
