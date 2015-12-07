require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}


  describe '#show_menu'
    it 'show_menu displays menu for customer' do
      expect(takeaway.show_menu).to eq "Pizza : £9.99"
    end
    describe '#place_order'
    it 'allows a specific number of dishes to be ordered from the menu' do
      expect{takeaway.place_order}.to_not raise_error
    end

end
