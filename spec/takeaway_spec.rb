require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  describe '#show_menu' do
    it 'displays a menu to a customer' do
      expect(takeaway.show_menu).to eq []
    end
  end

end
