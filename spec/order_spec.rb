require 'order'

describe Order do
  context 'after initializing choice, quantities, user_total' do
    let(:new_order) do
      choice = [:chow_mein, :singapore_rice, :prawn_crackers]
      quantities = [3, 1, 2]
      user_total = 25.25
      new_order = Order.new(*choice, quantities, user_total)
    end

    it 'knows the total price of the choice' do
      expect(new_order.calculate_price).to eq 25.25
    end

    it 'verifies the price is the same as the user_total' do
      expect(new_order).to be_verified
    end
  end
end
