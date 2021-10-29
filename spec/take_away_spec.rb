require 'take_away'

describe "TakeAway" do
  it 'adds items to order' do
    take_away = TakeAway.new
    take_away.order("Margherita", 2)
    expect(take_away.basket).to include(["Margherita", "Margherita"])
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
