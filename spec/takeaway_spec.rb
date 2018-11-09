require 'takeaway'
require 'menu'

describe Takeaway do
  sample_dishes = [{ :name => 'Fish', :price => 2.50 }, { :name => 'Chips', :price => 1.20 }]
  let(:menu) { instance_double("Menu", :view => sample_dishes) }
  let(:subject) { Takeaway.new(menu) }

  context '#view_menu' do
    it 'displays the menu' do
      expect(subject.view_menu).to eq sample_dishes
    end
  end

  describe 'placing an order' do
    let(:dish) { instance_double("Dish", :name => 'Curry', :price => 2.95) }

    context '#view_order' do
      it 'has nothing in the order to begin with' do
        subject.start_order
        expect { subject.view_order }.to output('').to_stdout
      end

      it 'raises an error if an order has not been created' do
        error_message = 'There is currently no order open'
        expect { subject.view_order }.to raise_error error_message
      end
    end

    context '#add_to_order' do
      it 'opens a new order if one is not already open' do
        subject.add_to_order(dish)
        expect { subject.view_order }.not_to raise_error
      end

      it 'adds an item to the order' do
        subject.add_to_order(dish)
        printout = "1 #{dish.name} @ %.2f".ljust(20) % dish.price
        printout.concat("%.2f".rjust(6) % dish.price)
        expect { subject.view_order }.to output(printout).to_stdout
      end

      it 'records the quantity ordered for each dish' do
        subject.add_to_order(dish, 3)
        printout = "3 #{dish.name} @ %.2f".ljust(20) % dish.price
        printout.concat("%.2f".rjust(6) % (3 * dish.price))
        expect { subject.view_order }.to output(printout).to_stdout
      end
    end
  end
end
