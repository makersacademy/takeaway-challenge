require 'takeaway'
describe TakeAway do
  menu = {"Fried Rice": 5, "Chicken Chow Mein": 7, "Cheeseburger": 6, "Pizza": 8}
  subject(:takeaway){ described_class.new }
  let(:menu){double :menu, display_menu: {"Fried Rice": 5, "Chicken Chow Mein": 7, "Cheeseburger": 6, "Pizza": 8}}

  it 'shows the menu' do
    expect(takeaway.read_menu).to eq menu
  end

  it{is_expected.to respond_to(:order_food).with(2).argument}
  it{is_expected.to respond_to(:order_food).with(1).argument}

  it 'takes an order' do
    order = "Fried Rice","Chicken Chow Mein"
    expect(takeaway.order_food(order)).to eq [order]
  end

end
