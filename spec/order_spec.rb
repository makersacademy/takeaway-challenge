require 'order'

describe Order do

  subject(:order) {described_class.new(menu)}

  let(:menu) {double :menu}
  let(:items) do {
          "venison pie" => 8,
          "vegan platter" => 7
        }
  end

  it 'lets customers select items from the menu' do
    order.add_item("venison pie", 8)
    order.add_item("vegan platter", 7)
    expect(order.total).to eq 15
  end

  it 'does not allow non-menu items to be added' do
    allow(menu).to receive(:has_item?).with(:burger).and_return false
    expect {order.add_item(:burger, 1)}.to raise_error NoItemError, "No such dish"
  end

end
