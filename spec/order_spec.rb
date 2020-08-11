require 'order'

describe Order do
    subject(:order) { described_class.new }

    let(:dishes) do 
        { salad: 1, pizza: 2 }
end 

it 'selects several available dishes from menu' do
        order.add(:salad, 1)
        order.add(:pizza, 2)
        expect(order.dishes).to eq(dishes)
    end


 end 
