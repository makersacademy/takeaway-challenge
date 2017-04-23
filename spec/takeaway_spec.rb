require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  it { is_expected.to respond_to(:order).with(2).argument}

  describe '#show_menu' do
    context 'Shows the menu list' do
      it 'calls #menu_print' do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end

  describe "#order" do
     context "gives the item and quantity needed" do
     before :each do
     @item = takeaway.menu.list.first[0]
   end
      it "puts the item from the order list in a hash " do
       takeaway.order(@item, 2)
       expect(takeaway.order_list.first[0]).to be @item
   end

   it "multiplies the item price by the quantity" do
        price = takeaway.menu.list.first[1]
        takeaway.order(@item, 2)
       expect(takeaway.order_list.first[1]).to eq(price * 2)
      end
    end
end

end
