require 'take_away'


describe "TakeAway" do
  it 'is initailised with an empty basket' do
    take_away = TakeAway.new
    expect(take_away.basket).to be_empty
  end

  it 'adds items to the basket' do
    take_away = TakeAway.new
    take_away.add_item_to_basket("Margherita", 2)
    expect(take_away.basket.length).to be(2)
  end

  it 'checks the basket sub total' do
    take_away = TakeAway.new
    take_away.add_item_to_basket("Margherita", 2)
    take_away.add_item_to_basket("Salami", 1)
    expect(take_away.check_basket_sub_total).to eq ("The total is £25.")
  end

  it "clears the basket" do
    take_away = TakeAway.new
    take_away.add_item_to_basket("Margherita", 2)
    expect(take_away.empty_basket).to be_empty
  end

  it "gives the total order" do
    take_away = TakeAway.new
    take_away.add_item_to_basket("Margherita", 2)
    take_away.check_basket_sub_total
    expect(take_away.order_checkout).to eq ("Thank you for your order. The total is £16.")
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
