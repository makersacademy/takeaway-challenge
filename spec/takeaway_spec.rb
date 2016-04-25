require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, menu_list: { chicken: 3 }) }
  let(:menu_class) { double(:Menu, new: menu)}
  subject(:takeaway) { described_class.new(menu: menu_class)}

    describe '#initialize' do
      it "has an empty order at the start" do
        expect(takeaway.current_order).to eq []
      end
    end
    describe '#see_menu' do
      it "shows the menu" do
        takeaway.see_menu
        expect(menu).to have_received(:menu_list)
      end
    end
    describe '#order' do
      it "adds an item to the order" do
        expect(takeaway.order(:chicken)).to eq [{:chicken=>3}]
      end
      it "raises an erro if the item is not on the menu" do
        expect{takeaway.order(:foo)}.to raise_error "No such dish here!"
      end
    end
    describe '#total' do
      it "should show the total" do
      takeaway.order(:chicken)
      expect(takeaway.total).to eq 3
      end
    end
end
