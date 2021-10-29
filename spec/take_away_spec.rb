require 'take_away'

describe "TakeAway" do
  it 'adds itms to order' do
    take_away = TakeAway.new
    basket = []
    take_away.order("Margherita", 2)
    expect(basket).to eq("Margherita")
  end
end






# require 'menu'

# subject(:order) { described_class.new(menu) }
# let(:menu) {double("Menu") }

# let(:dishes) do
#     {
#         pizza: 2,
#         chips: 1
#     }
# end

# it 'addsdishes from the menu' do
#     expect(order.add_dishes("chips")).to eq("chips")
# end
