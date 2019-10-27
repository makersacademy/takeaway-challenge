require 'takeaway'

describe Takeaway do
  items = { pizza: 6, fries: 1 }
  let(:confirminator) { double Confirminator }
  let(:subject) { Takeaway.new(items, confirminator) }

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
      expect(subject.basket).to include({ pizza: 1 })
    end

    it 'raises an error when an off-menu item is added' do
      expect { subject.add_to_basket(:fanta, 1) }.to raise_error 'Item not on menu'
    end
  end

  context 'placing order' do
    before do
      subject.add_to_basket(:fries, 1)
      allow(confirminator).to receive(:confirm)
    end

    it 'raises an error if the customer total does not equal actual total' do
      expect { subject.place_order(4) }.to raise_error 'Incorrect total'
    end

    it 'does not raise error if customer total is equal to actual total' do
      expect { subject.place_order(1) }.not_to raise_error
    end

    it 'calls confirminator with a delivery time if order is successful' do
      expect(confirminator).to receive(:confirm)
      subject.place_order(1)
    end
  end
end
