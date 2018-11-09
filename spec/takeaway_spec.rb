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

  context 'placing an order' do
    let(:dish) { instance_double("Dish", :name => 'Curry', :price => 2.95) }
    it 'can create an order' do
      subject.start_order
      expect(subject.current_order).not_to be nil
    end

    it 'has nothing in the order to begin with' do
      subject.start_order
      expect(subject.view_order).to eq ''
    end

    it 'adds an item to the order' do
      subject.start_order
      subject.add_to_order(dish)
      printout = "1 #{dish.name} @ %.2f" % dish.price
      expect(subject.view_order).to eq printout
    end
  end
end
