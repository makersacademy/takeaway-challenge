require 'takeaway-challenge'

describe Takeaway do
  it { is_expected.to be_kind_of(Takeaway) }

  describe 'Ordering' do
    it 'allows a customer to see the menu' do
      expect(subject.see_menu).to eq(@menu) 
    end

    it 'allows a customer to add items from the menu to their order' do
      expect(subject.place_order(1)).to include (subject.customer_order[0])
    end
  end 
end