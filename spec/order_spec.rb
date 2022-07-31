require 'order'
require 'menu'

describe Order do
    subject(:order) { described_class.new(menu) }

    let(:menu) { double(:menu) }

    let(:dishes) do
        { beef: 4,
        sausage: 2
        }
    end

    before do
        allow(menu).to receive(:has_dish?).with(:beef).and_return(true)
        allow(menu).to receive(:has_dish?).with(:sausage).and_return(true)
    end

    it 'selects several dishes from the menu' do
        order.add(:beef, 4)
        order.add(:sausage, 2)
        expect(order.dishes).to eq(dishes)
    end

    it 'does not select dishes which are not on the menu' do
        allow(menu).to receive(:has_dish?).with(:chicken).and_return(false)
        expect { order.add(:chicken, 2) }.to raise_error NoItemError, "Chicken is not on the menu!"
    end

end