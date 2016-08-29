require 'order'
require 'menu'

describe Order do

  subject(:order) {described_class.new(menu)}
  let(:items) do {
          "venison": 8,
          "salad": 7
        }
  end
  let(:menu) {double :menu, items: items}


  before do
   allow(menu).to receive(:has_item?).with(:venison).and_return(true)
   allow(menu).to receive(:has_item?).with(:salad).and_return(true)
   allow(menu).to receive(:has_item?).with(:burger).and_return(false)

   allow(menu).to receive(:price).with(:venison).and_return(8)
   allow(menu).to receive(:price).with(:salad).and_return(7)
 end

  def test_order
    order.add_item("venison", 1)
    order.add_item("salad", 1)
  end

    it "selects several items from the menu" do
    test_order
    expect(order.basket).to eq basket
  end

  it 'does not allow non-menu items to be added' do
    expect {menu.add_item(:burger, 1)}.to raise_error NoItemError, "No such dish"
  end

  it "calculates the total for the order" do
   test_order
   total = 15
   expect(order.total).to eq(total)
 end

end
