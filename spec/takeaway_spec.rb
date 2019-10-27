require 'takeaway'

describe Takeaway do
  items = { pizza: '£6', fries: '£1' }
  let(:subject) { Takeaway.new(items) }

  context 'menu' do
    it 'has a menu on initialization' do
      expect(Takeaway.new.menu).to be_a(Menu)
    end

    it 'accepts menu items passed in as hash on initialization' do
      expect(subject.menu).to be_a(Menu)
    end
  end

  context 'placing order' do
    it 'accepts an order via "place_order"' do
      expect { subject.place_order({ pizza: 1, fries: 1, total: 7 }) }.not_to raise_error
    end
  end
end
