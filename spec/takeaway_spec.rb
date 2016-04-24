require 'takeaway'
# require 'twilio-ruby'

describe Takeaway do
  let(:item) {double :item}
  subject(:takeaway) { described_class.new }
  let(:menu_list) { {chiken_foo_young: 4, chilli_spicy_chiken: 3}  }
  let(:menu) {double :menu, display_menu: {chiken_foo_young: 4}}

    describe '#initialize' do
      it "has an empty order at the start" do
        expect(takeaway.current_order).to eq []
      end
    end
    describe '#see_menu' do
      it "shows the menu" do
        expect(takeaway.see_menu).to be_a Hash
      end
    end
    describe '#order' do
      it "adds an item to the order" do
        expect(takeaway.order(:chiken_foo_young)).to eq [{:chiken_foo_young=>4}]
      end
      it "raises an erro if the item is not on the menu" do
        expect{takeaway.order(:foo)}.to raise_error "No such dish here!"
      end
    end
    describe '#checkout' do
      it "rasise an error if the total is not correct" do
         expect { takeaway.checkout(15)}.to raise_error "the total is not correct"
      end
    end
end
