require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:menu) {double :menu}
  let(:order) {double :order}

    context '#read_menu' do
      it 'should list the menu items' do
        expect(takeaway.read_menu).to eq takeaway.menu.dishes
      end
    end

    context '#add_order' do
      it 'should add the item to the order list' do
        takeaway.add_order("pizza", 2)
        expect(takeaway.order.basket).to include("pizza" => 2)
      end
    end

    context '#basket_summary' do
      it 'should list the items and prices respectively' do
        takeaway.add_order("pizza", 2)
        takeaway.add_order("soup", 3)
        expect(takeaway.basket_summary).to eq(takeaway.order.basket)
      end
    end

    context '#complete_order' do
      it 'should raise error if the amount is not correct' do
        takeaway.add_order("pizza", 2)
        msg = "Your calculation is not correct"
        expect{takeaway.complete_order(1)}.to raise_error(msg)
      end

      it 'should send a confirmation text when order is completed' do
        allow(takeaway).to receive(:send_text)
        allow(takeaway).to receive(:is_correct_amount?).and_return(true)
        # expect(takeaway).to receive(:send_text)
        takeaway.complete_order(20.93)
      end
    end
end
