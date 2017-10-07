require 'dishes'

describe Dishes do
  subject(:dishes) { described_class.new }
  let(:item1) { { name: "Chop Suey", price: 15.99 } }
  let(:item2) { { name: "Thai Curry", price: 11.99 } }
  let(:item3) {   { name: "Singapore Noodles", price: 9.99 } }

  it 'is initialsed with a menu' do
    expect(dishes.list).to include(item1, item2, item3)
  end

  # it 'adds dishes' do
  #   dishes.add_item(name, price)
  #   expect(dishes.list).to include({ name: name, price: "£#{price}" })
  # end

end
