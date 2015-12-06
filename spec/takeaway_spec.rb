require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  describe '#show_menu' do
    it 'should show a list of available menu items' do
      expect(takeaway.show_menu).to eq takeaway.menu
    end
  end
end
