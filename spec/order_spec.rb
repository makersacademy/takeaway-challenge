require 'order'

describe Order do

  subject(:order) {described_class.new(checkout: checkout, menu: menu)}

  let(:burger) {double :burger}
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
    error_msg = "No such dish, please select from the menu"
    expect {order.place_order(burger, 1)}.to raise_error error_msg
  end

end
