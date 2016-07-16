require 'takeaway'
require 'current_order'

describe Takeaway do

  context 'when viewing' do

    it 'has a list of dishes and prices to be viewed' do
      expect(subject.view_menu).to_not be_nil
    end

  end

  context 'when ordering' do

    it 'accepts and stores an order' do
      dummy_order = 'Lemonade'
      subject.place_order dummy_order
      expect(subject.order.customer_order[0][:selection]).to eq dummy_order
    end

    it 'rejects an invalid entry' do
      message = "Sorry, we don't currently offer that dish"
      expect(subject.place_order 'Marshmallow').to eq message
    end

    it 'has a method to view an order' do
      order = CurrentOrder.new.view_order
      expect(subject.view_order).to eq order
    end

  end

  context 'when completing an order' do

    it "won't checkout if no order placed" do
      message = "Sorry, you haven't placed an order yet!"
      expect(subject.checkout).to eq message
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
