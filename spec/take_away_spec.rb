require 'take_away'

describe TakeAway do
  subject(:takeaway)  {described_class.new(menu: menu, order: order)}

  let(:menu) {double :menu, list_menu: list_menu}
  let(:list_menu) {"Pollo, $5"}

  let(:order) {double :order, checkout: checkout}
  let(:checkout) {"The total amount is $20.00"}
  let(:selected_dishes) do {:chicken => 3, :meatballs =>4} end

  it 'shows the menu with the dishes and prices' do
    expect(takeaway.show_menu).to eq list_menu
  end

  it 'allows the customer to select dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(selected_dishes)
  end
end
