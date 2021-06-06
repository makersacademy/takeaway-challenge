require 'order'

describe Order do
    let(:menu_double) { double{:menu}}

    let(:order_double) { Order.new(dishes, menu_double)}


    let(:dishes) do
        {
        chicken: 2,
        fish: 1
        }
    end

    before do
        allow(menu_double).to receive(:has_dish?).with(:chicken).and_return(true)
        allow(menu_double).to receive(:has_dish?).with(:fish).and_return(true)

        allow(menu_double).to receive(:price).with(:chicken).and_return(3.00)
        allow(menu_double).to receive(:price).with(:fish).and_return(4.00)


    end

    it 'selects several dishes from the menu' do
      order_double.add(:chicken, 2)
      order_double.add(:fish, 1)
      expect(order_double.dishes).to eq(dishes)
    end

    it "doesn't allow items to be added unless they are on the menu" do
        allow(menu_double).to receive(:has_dish?).with(:beef).and_return(false)

        expect { order_double.add(:beef, 2) }.to raise_error 'Not on menu'
    end

    it 'calculates the total for the order' do
      order_double.add(:chicken, 2)
      order_double.add(:fish, 1)
      total = 10
      expect(order_double.total).to eq(total)
    end
end