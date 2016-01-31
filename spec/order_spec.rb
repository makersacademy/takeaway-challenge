require 'order'

RSpec.describe Order do

  let(:menu) {double :menu, show_menu:
    {"chicken" =>3,
     "rice" =>1,
     "pizza" =>6,
     "chips" =>2
    }
  }


  subject(:order)  {described_class.new(menu)}

  before do
    allow(menu).to receive(:price_of).with("chicken").and_return(3)
    allow(menu).to receive(:price_of).with("rice").and_return(1)
    allow(menu).to receive(:price_of).with("pizza").and_return(6)
    allow(menu).to receive(:price_of).with("ham").and_return(nil)
  end

  it {is_expected.to respond_to(:size)}

  it {is_expected.to respond_to(:add).with(2).arguments}

  it 'push a dish-amount pair onto the basket' do
    expect(order.size).to eq(0)
    order.add("chicken", 3)
    expect(order.size).to eq(1)
  end

  it {is_expected.to respond_to(:total)}

  it 'calculates the total cost of the items selected' do
    expect(order.total).to eq(0)
    order.add("chicken", 3)
    expect(order.total).to eq(9)
    order.add("rice", 5)
    expect(order.total).to eq(14)
  end



end