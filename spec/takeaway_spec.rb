require 'takeaway'
require 'current_order'

describe Takeaway do

  let(:takeaway) { described_class.new }
  let(:menu) { double :menu }

  context 'when viewing' do

    it 'has a list of dishes and prices to be viewed' do
      allow(menu).to receive(:show_menu).and_return true
      expect(takeaway.view_menu).to_not be_nil
    end

  end

  context 'when ordering' do

    it 'accepts and stores an order' do
      dummy_order = 'Lemonade'
      takeaway.place_order dummy_order
      expect(takeaway.order.customer_order[0][:selection]).to eq dummy_order
    end

    it 'rejects an invalid entry' do
      message = "Sorry, we don't currently offer that dish"
      expect(takeaway.place_order('Marshmallow')).to eq message
    end

    it 'has a method to view an order' do
      order = CurrentOrder.new.view_order
      expect(takeaway.view_order).to eq order
    end

  end

  context 'when completing an order' do

    it "won't checkout if no order placed" do
      message = "Sorry, you haven't placed an order yet!"
      expect(takeaway.checkout).to eq message
    end

    # it 'resets an order on successful checkout' do
    #   #stub checkout
    #   subject.place_order "Olives"
    #   original = subject.view_order
    #   subject.checkout
    #   expect(subject.view_order).to_not eq original
    # end

  end

end
