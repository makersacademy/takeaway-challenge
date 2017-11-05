require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#show_menu' do
    it "should show the menu" do
      allow(takeaway.menu).to receive(:show).and_return 'full_menu'
      expect(takeaway.show_menu).to eq 'full_menu'
    end
  end
end
