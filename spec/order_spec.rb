require 'order'
require 'menu' # if we remove the verifying double, this becomes redundant

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double(:menu) } # You can use a verifying double, here, which
  # is {instance_double("Menu")}. It lets us check the menu class for the has_dish? method.
  let(:dishes) { { chicken: 2, fish: 1 } }

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
    allow(menu).to receive(:price).with(:chicken).and_return(3.00)
    allow(menu).to receive(:price).with(:fish).and_return(2.50)
  end

  def create_order
    order.add(:chicken, 2)
    order.add(:fish, 1)
  end
# we create a create_order method here in the spec file to DRY out the tests

  describe "#add order"
  it 'lets me select several dishes' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  # it 'doesnt let me select dishes that are not on the menu' do
  #   allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
  #   expect{ order.add(:beef, 2)}.to raise_error NoItemError, "Beef is not on the menu!"
  # end

  describe "calculate total for dishes added"
  it 'calculates the total for the order' do
    create_order
    # total = 8.50
    expect(order.total).to eq 8.50
  end

end
