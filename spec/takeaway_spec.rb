require 'takeaway'

describe Takeaway do
  items = { pizza: '£6', fries: '£1' }
  let(:subject) { Takeaway.new(items) }

  context 'menu' do
    it 'accepts "view_menu" method' do
      expect { subject.view_menu }.not_to raise_error
    end
  end

  context 'adding to basket' do
    it 'basket starts empty' do
      expect(subject.basket).to eq({})
    end

    it 'adds item and quantity to basket when add_to_basket is called' do
      subject.add_to_basket(:pizza, 1)
      expect(subject.basket).to include({pizza: 1})
    end

    it 'raises an error when an off-menu item is added' do
      expect { subject.add_to_basket(:fanta, 1) }.to raise_error 'Item not on menu'
    end
  end

  context 'placing order' do
    it 'accepts a quantity into place_order' do
      expect { subject.place_order(1) }.not_to raise_error
    end
  end
end
