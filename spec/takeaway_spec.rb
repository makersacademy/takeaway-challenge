require 'takeaway'

describe Takeaway do
  items = { pizza: '£6', fries: '£1' }
  let(:subject) { Takeaway.new(items) }

  context 'menu' do
    it 'accepts "view_menu" method' do
      expect { subject.view_menu }.not_to raise_error
    end
  end

  context 'placing order' do
    it 'accepts an order via "place_order"' do
      expect { subject.place_order({ pizza: 1, fries: 1, total: 7 }) }.not_to raise_error
    end
  end
end
