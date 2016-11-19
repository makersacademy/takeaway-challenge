require 'takeaway'
require 'menu'
  describe Takeaway do
    subject(:takeaway) { described_class.new }
    let(:menu) {double :menu}

    before do
      allow(menu).to receive(:list).and_return(scrambled_eggs: 5)
    end

    it 'should initialize with an empty order hash' do
      expect(takeaway.order).to be_empty
    end

    it 'should access the menu from the Menu class' do
      expect(takeaway.menu).to include(scrambled_eggs: 5)
    end

    describe "#see_menu" do
      it 'should show the customer the menu' do
        expect(takeaway.see_menu).to include(scrambled_eggs: 5)
      end
  end
end
