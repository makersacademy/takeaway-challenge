require './lib/takeaway.rb'
describe Takeaway do

  let(:dish_double) { double :dish, dish_number: 1, dish_name: 'Chicken Tikka', dish_cost: 5 }
  let(:menu_double) { double :menu, dishes: [dish_double] }
  let(:order_double) { double :order, add: [dish_double], contents: [dish_double], cost: 5 }
  before :each do
    @takeaway = Takeaway.new(menu_double, order_double)
  end

  describe 'Interacting with the menu' do
    describe '#show_menu' do
      it 'Returns a menu when asked' do
        expect { @takeaway.show_menu }.
        to output("Hello, Here is a list of our tasty food\n"\
        "Dish Number: #{dish_double.dish_number}, Name: #{dish_double.dish_name},"\
        " Price: #{dish_double.dish_cost}\n").to_stdout
      end
    end
  end

  describe 'Interacting with the order' do
    describe '#show order' do
      it 'displays the current order in a neat list' do
        @takeaway.add_to_order(dish_double.dish_number)
        expect { @takeaway.view_order }.
        to output("Here is your current order\n"\
        "Dish Number: 1, Name: Chicken Tikka, Price: 5\n"\
        "The total cost of your order is 5\n").to_stdout
      end
    end
    
    describe '#add to order' do
      it 'includes a subitted dish in the current order' do
        @takeaway.add_to_order(dish_double.dish_number, 2)
        expect(@takeaway.current_order.contents).to include dish_double
      end
    end
  
  end
end
