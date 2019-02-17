require './lib/takeaway.rb'
describe Takeaway do

  let(:dish_double) { double :dish, dish_number: 1, dish_number_2: 5, dish_name: 'Chicken Tikka', dish_cost: 5 }
  let(:menu_double) { double :menu, dishes: [dish_double] }
  let(:order_double) { double :order, add: [dish_double], contents: [dish_double], cost: 5, remove: [] }
  let(:order_double2) { double :order2, add: [dish_double], contents: [], cost: 5, remove: [] }
  let(:confirmation_double) { double :confirmation, send_confirmation: 'Hey James!, Your order has been confirmed' }
  before :each do
    @takeaway = Takeaway.new(menu_double, order_double, confirmation_double)
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

      it 'fails if there is nothing in the current order' do
        @takeaway = Takeaway.new(menu_double, order_double2, confirmation_double)
        expect { @takeaway.view_order }.\
        to raise_error "Nothing has been added to the current order!"
      end
    end
    
    describe '#add to order' do
      it 'includes a subitted dish in the current order' do
        @takeaway.add_to_order(dish_double.dish_number, 2)
        expect(@takeaway.current_order.contents).to include dish_double
      end

      it 'fails if a dish number is given which is not on the menu' do
        expect { @takeaway.add_to_order(dish_double.dish_number_2, 2) }.\
        to raise_error "You provided an incorrect dish number!"
      end
    end

    describe '#remove from order' do
      it 'removes the stated dish from the current order' do
        @takeaway.add_to_order(dish_double.dish_number, 2)
        @takeaway.remove_from_order(dish_double.dish_number)
        @takeaway.instance_variable_set(:@current_order, [])
        expect(@takeaway.current_order).not_to include dish_double
      end

      it 'fails if a dish number is given which is not on the menu' do
        expect { @takeaway.remove_from_order(dish_double.dish_number_2) }.\
        to raise_error "You provided an incorrect dish number!"
      end
    end

    describe '#confirm order' do
      it 'send a confirm order call to the confirmation class' do
        @takeaway.add_to_order(dish_double.dish_number, 2)
       
        expect(confirmation_double).to receive(:send_confirmation).and_return('Hey James!, Your order has been confirmed')
        @takeaway.confirm_order
      end

      it 'fails if there is nothing in the current order' do
        @takeaway = Takeaway.new(menu_double, order_double2, confirmation_double)
        expect { @takeaway.confirm_order }.\
        to raise_error "Nothing has been added to the current order!"
      end
    end
  end
end
