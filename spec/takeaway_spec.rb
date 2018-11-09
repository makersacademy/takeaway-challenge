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
    it 'can create an order' do
      subject.start_order
      expect(subject.current_order).not_to be nil
    end

    it 'has nothing in the order to begin with' do
      subject.start_order
      expect(subject.view_order).to eq ''
    end
  end
end
