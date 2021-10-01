require 'order'

describe Order do

    let(:dishes) do
        {
          lasagna: 2,
          fish: 1
        }
    end

    it "selects several dishes from the menu" do
        expect(order.dishes).to eq(dishes)
    end

end