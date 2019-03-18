require 'order'

describe Order do
  subject(:order) { Order.new(menu) }

  let(:menu) { double(:menu) }
  let(:bucket) do
    { curry: 1, 
      chips: 2 }
  end

  before do
    allow(menu).to receive(:include).with(:curry).and_return(true)
    allow(menu).to receive(:include).with(:chips).and_return(true)

    allow(menu).to receive(:price).with(:curry).and_return(6)
    allow(menu).to receive(:price).with(:chips).and_return(2)
  end

  it "selects several dishes from the menu" do
    order.add(:curry, 1)
    order.add(:chips, 2)
    expect(order.bucket).to eq bucket
  end

  it "prevents items from adding to bucket that are not in menu" do
    allow(menu).to receive(:include).with(:pasta).and_return(false)
    expect { order.add(:pasta, 1) }.to raise_error 'Not in menu!'
  end

  it 'calculates the total for order' do
    order.add(:curry, 1)
    order.add(:chips, 2)
    total = 10
    expect(order.total).to eq 10
  end
  
end
