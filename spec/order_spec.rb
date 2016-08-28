require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:dishes) do    {
          "venison pie" => 7.50,
          "vegan platter" => 7.00
        }
  end

  it 'takes the customer order' do
    order.add_item("venison pie", 7.50)
    order.add_item("vegan platter", 7.00)
    expect(order.total).to eq 14.50
  end
end
