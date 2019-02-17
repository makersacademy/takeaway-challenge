require 'order'
require 'menu' # if we remove the verifying double, this becomes redundant

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) {double(:menu)} # You can use a verifying double, here, which
  # is {instance_double("Menu")}. It lets us check the menu class for the has_dish? method.

  let(:dishes) do
    {chicken: 2,
    fish: 1}
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)
  end

  # it 'lets me select several dishes' do
  #   order.add(:chicken, 2)
  #   order.add(:fish, 1)
  #   expect(order.dishes).to eq(dishes)
  # end

  it 'lets me order any quantity of available dishes' do
    dish = "Pizza"
    quantity = 2
    order_double = double(:dish => dish, :quantity => quantity)
    expect(subject.add(order_double)).to eq "#{dish}, #{quantity}"
  end

  # it 'doesnt let me select dishes that are not on the menu' do
  #   allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
  #   expect{ order.add(:beef, 2)}.to raise_error NoItemError, "Beef is not on the menu!"
  # end

end
