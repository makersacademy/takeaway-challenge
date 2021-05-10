require 'order'
require 'menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }

  let(:dishes) do
    {
      lasagne: 2,
      ratatouille: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:lasagne).and_return(true)
    allow(menu).to receive(:has_dish?).with(:ratatouille).and_return(true)

    allow(menu).to receive(:price).with(:lasagne).and_return(8.99)
    allow(menu).to receive(:price).with(:ratatouille).and_return(9.99)
  end

  it 'selects several dishes from menu' do
    order.add(:lasagne, 2)
    order.add(:ratatouille, 1)
    expect(order.dishes).to eq(dishes)
  end

# used a class Error as found at https://www.honeybadger.io/blog/ruby-custom-exceptions/
  it 'does not allow dishes to be added that are not on menu' do
    allow(menu).to receive(:has_dish?).with(:steak).and_return(false)
    expect { order.add(:steak, 2) }.to raise_error NoDishError
  end

  it 'calculates the total order' do
    order.add(:lasagne, 2)
    order.add(:ratatouille, 1)
    total = 27.97
    expect(order.total).to eq(total)
  end
end
