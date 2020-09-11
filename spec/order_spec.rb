require_relative '../lib/order'

describe Order do
  it { is_expected.to respond_to :select}
end

describe Order do
  let(:order) { Order.new }
  let(:current_order) { order.current_order }
  let(:select) { order.select(1,2) }
  let(:checked) { order.check_total }
  #let(:send) { double("send_text", order.send(:send_text) => "Thank you! Your order was placed and will be delivered before 18:52")}

  it 'makes a selection' do
    expect{select}.to change{ current_order.size }.by(1)
  end
  it 'checks the total' do
    expect { checked }.to output{ true }.to_stdout
  end
  it 'fails to place an order without checking' do
    expect(order.place_order).to be_an(String)
  end
  it 'display returns a menu hash' do
    expect(order.display).to be_an(Hash)
  end

  it '#reset' do
    select
    expect{ order.reset }.to change{order.current_order.size}.to 0
  end

  it '#check_total' do
    expect{checked}.to output.to_stdout
  end

end