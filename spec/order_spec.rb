require 'order'

RSpec.describe Order do
  describe 'Check if Order class can' do
    new_order = [{ dish: "Dish-02", total: 2 }, { dish: "Dish-04", total: 3 }, 10.45]

    it 'respend to check_order method' do
      expect(subject).to respond_to(:check_order)
    end

    it 'passes the correct information to check__order_is_valid' do
      expect { subject.new_order = new_order }.to change { subject.new_order }.to new_order
    end

    it 'let its method check_order pass the new order received to CheckOrder class' do
      subject.new_order = new_order
      expect(subject.check_order).to eq true
    end
  end
end
