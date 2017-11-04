require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new }

  let(:menu) { double('menu') }
  let(:order) { double('order') }
  let(:dish) { double('dish') }

  context 'Initialization' do
    it 'initializes an empty @order_history array' do
      expect(takeaway.order_history).to eq []
    end
  end

  context 'Menu interaction methods' do
    it 'Requests Menu to print itself' do
      allow(takeaway.menu).to receive(:show).and_return('Menu Details')
      expect(takeaway.show_menu).to eq 'Menu Details'
    end
  end

  context 'Order interaction methods' do
    before do
      allow(takeaway.order).to receive_messages(add_dish: 'Dish Added',
        remove_dish: 'Dish Removed', show: 'Order Details')
      allow(takeaway).to receive_messages(send_text: 'Message sent')
    end

    it 'Requests Order to add a dish' do
      expect(takeaway.add_dish(1)).to eq 'Dish Added'
    end

    it 'Requests Order to remove a dish' do
      expect(takeaway.remove_dish(1)).to eq 'Dish Removed'
    end

    it 'Requests Order to print its details' do
      expect(takeaway.show_order).to eq 'Order Details'
    end

    it 'adds order to order_history array' do
      takeaway.confirm_order
      expect(takeaway.order_history).not_to be_empty
    end
  end

end
