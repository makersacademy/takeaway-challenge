require_relative '../lib/order'

describe Order do
  it { is_expected.to respond_to :select}
end

describe Order do
  let(:order) { Order.new }
  let(:menu) { order.select(1,2) }
  it 'makes a selection' do
    allow($stdin).to receive(:gets).and_return("1","2","3")
    expect{menu}.to change{ order.current_order.size }.by(2)
  end
end