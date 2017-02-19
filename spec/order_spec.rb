# require './lib/order'
# require './lib/messager'
#
# describe Order do
#
#   let(:messager2) {double :messager2}
#   subject(:order) {described_class.new(Menu.new)}
#
#   before do
#     allow(subject.messager).to receive(:message) {messager2}
#   end
#
#   it "should be able to select a dish from the menu" do
#     order.make_order("sandwich" => 1)
#     expect(order.basket).to eq ([{"sandwich" => 3}])
#   end
#
#   it "should be able to select more than one dish from the menu" do
#     order.make_order("sandwich" => 1)
#     order.make_order("jellyfish" => 1)
#     expect(order.basket).to eq ([{"sandwich" => 3}, {"jellyfish" => 5}])
#   end
#
#   it "should be able to select an amount of the same dish from the menu" do
#     order.make_order("sandwich" => 2)
#     expect(order.basket).to eq ([{"sandwich" => 3}, {"sandwich" => 3}])
#   end
#
#
#   it "should be able to show the complete order price" do
#     order.make_order("sandwich" => 2)
#     order.make_order("jellyfish" => 3)
#     order.complete_order
#     expect(order.total).to eq 21
#   end
#
#   it "should fail to check out if the total does not match the sum of the various dishes" do
#     order.make_order("sandwich" => 2)
#     order.make_order("jellyfish" => 3)
#     order.complete_order
#     expect {order.checkout(23)}.to raise_error "That is not the right total"
#   end
#
# end

require './lib/order'
require './lib/menu'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { instance_double("Menu")}

  let(:dishes) do
    {
    chicken: 2,
    fish: 1
    }
  end

  before do
    allow(menu).to receive(:has_dish?).with(:chicken).and_return(true)
    allow(menu).to receive(:has_dish?).with(:fish).and_return(true)

    allow(menu).to receive(:price).with(:chicken).and_return(3.00)
    allow(menu).to receive(:price).with(:fish).and_return(2.50)
  end



  it 'selects several dishes from the menu' do
    create_order
    expect(order.dishes).to eq(dishes)
  end

  it "doesn't allow items to be added that are not on the menu" do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { order.add(:beef, 2) }.to raise_error NoItemError, "Beef is not on the menu!"
  end

  it "calculates the total for the order" do
    create_order
    total = 8.50
    expect(order.total).to eq(total)
  end

  def create_order
    order.add(:chicken, 2)
    order.add(:fish, 1)
  end
end
