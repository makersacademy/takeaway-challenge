require_relative '../lib/takeaway'

describe Takeaway do

  let(:menu) { Hash[chips: 3, burger: 4, pastie: 5] }
  let(:order) { ["chips", "chips", "pastie", "pastie"] }

  it 'has a list of dishes' do
    expect(subject.menu).to eq menu
  end

  describe '#add_to_order' do
    it 'can select items from the menu' do
      subject.add_to_order("chips", 2)
      subject.add_to_order("pastie", 2)

      expect(subject.order).to eq order
    end
  end

  describe '#total_correct?' do
    it 'can check given total is correct' do
      subject.add_to_order("chips", 2)
      subject.add_to_order("pastie", 2)

      expect(subject.total_correct?(16)).to be true
    end
  end

  describe '#place_order' do
    it 'confirms the order has been placed' do
      expect(subject.place_order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end

end
