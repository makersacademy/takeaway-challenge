require './lib/order.rb'

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu)}

  let(:dishes) do
    { egg: 1,
      eggs: 2}
  end

  before do
    allow(menu).to receive(:has_dish?).with(:Egg).and_return(true)
    allow(menu).to receive(:has_dish?).with(:Eggs).and_return(true)
  end

  it "selects multiple dishes" do
    order.add(:egg, 1)
    order.add(:eggs, 2)
    expect(order.dishes).to eq(dishes)
  end

  it "raises an error if the item is not on the menu" do
    allow(menu).to receive(:has_dish?).with(:eggs).and_return(false)
    expect{order.add(:eggs, 6)}.to raise_error "That's too many eggs, don't be ridiculous."
  end

end


#
# describe Order do
#   subject(:order) { described_class.new }
#
#   describe add_item do
#     it 'adds item to total order' do
#       expect(order.add_item("egg", 1)).to eq ({"egg" => 1})
#     end
#
#     xit 'fails item is not on the menu' do
#       expect{order.add_item("six eggs", 6)}.to raise_error "That's too many eggs, don't take the piss."
#     end
#   end
#
#   xit 'can view order basket' do
#     order.add_item("five eggs", 5)
#     expect(order.view_basket).to eq ({"five eggs" => 5})
#   end
# end
