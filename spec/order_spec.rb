require 'order'

describe Order do
  subject(:order) { described_class.new(:menu_item) }

  it { is_expected.to respond_to :current_order }

  it 'should show the users current order' do
    expect(order.current_order).to eq [:menu_item]
  end

end
