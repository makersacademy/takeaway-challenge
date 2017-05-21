require 'order'

describe Order do
  MENU_PRICE = { price: 10 }
  subject(:order) { described_class.new(:menu_item, MENU_PRICE[:price], Time.now) }

  let(:new_item) { double(:new_item) }

  it { is_expected.to respond_to :current_order }

  it 'should show the users current order' do
    expect(order.current_order).to eq([{ :menu_item => MENU_PRICE[:price] }])
  end

  it 'can add other items to the order' do
    expect { order.add_to_order(:new_item, :price) }.to change { order.current_order.length }.by 1
  end

  it 'calculates the total for the current order' do
    order.add_to_order(:menu_item, MENU_PRICE[:price])
    order.add_to_order(:menu_item, MENU_PRICE[:price])
    expect(order.order_total).to eq MENU_PRICE[:price] * 3
  end

end
