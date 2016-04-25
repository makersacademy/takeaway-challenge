require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
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
    describe '#total' do
      it "should show the total" do
      takeaway.order(:chiken_foo_young)
      expect(takeaway.total).to eq 4
      end
    end
end
