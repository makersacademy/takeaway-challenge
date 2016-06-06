require 'order'

describe Order do
    subject(:order) {described_class.new}
    let(:dishes) do
        {
            pizza: 3,
            nuggets: 1
        }
    end
    
    it 'allows user to select dishes from the menu' do
        order.add(:pizza, 3)
        order.add(:nuggets, 1)
        expect(order.dishes).to eq(dishes)
    end

end