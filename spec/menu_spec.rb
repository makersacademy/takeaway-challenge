require 'menu'

# describe Menu do
#   class Order
#   end

#   let(:order) { Order.new { include Menu } }

#   it "knows a price of each dish" do
#     p = order.price('pizza')
#     expect(p).to eq(12.99)
#   end

# end

shared_examples 'menu' do

  let(:example) { described_class.new }

  it "knows a price of each dish" do
    expect(example.price(:pizza)).to eq(12.99)
  end

  it "sees the menu" do
    expect(described_class::MENU).to eq(Menu::MENU)
  end

end

