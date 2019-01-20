require 'order'

RSpec.describe Order do
  describe 'Check if Order class can' do
    it 'respend to check_order method' do
      expect(subject).to respond_to(:check_order)
    end

    it 'passes the correctr information to check__order_is_valid' do
      new_order = [{ dish: "Dish-02", total: 2 }, { dish: "Dish-04", total: 3 }, 10.45]

      expect { subject.check_order(new_order) }.to change { subject.new_order }.to new_order
    end
  end
end
