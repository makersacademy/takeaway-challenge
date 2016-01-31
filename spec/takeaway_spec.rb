require 'takeaway'
describe Takeaway do

  subject(:takeaway){described_class.new(:burger)}

  describe '#show_menu'do
    it 'shows the customer the available dishes and the prices'do
    expect(takeaway.show_menu).to eq MenuList::MENULIST[:burger]
    end
  end

  describe '#order'
    xit 'allows you to make an order'do

    end


  describe '#confirm_order'do
    it 'allows you to confirm order'do
    t = Time.now + 3600
    expect { takeaway.confirm_order([[:Hamburger, :Chips],[1,2],[6.50]]) }.to output("\"Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}\"\n").to_stdout

    end
  end

end
