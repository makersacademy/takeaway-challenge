require 'takeaway'
describe Takeaway do

  subject(:takeaway){described_class.new(:burger)}

  describe '#show_menu'do
    it 'shows the customer the available dishes and the prices'do
    expect(takeaway.show_menu).to eq MenuList::MENULIST[:burger]
    end
  end

  describe '#complete_order'do
    it 'allows you to order'do
    expect(takeaway.complete_order([[:Hamburger, :Chips],[1,2],[6.50]])).to eq true

    end
  end

end
