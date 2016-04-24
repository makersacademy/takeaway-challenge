require 'take_away'

describe TakeAway do
  subject(:takeaway)  {described_class.new(menu: menu, order: order, messenger: messenger, config: {})}

  let(:menu) {double :menu, list_menu: list_menu}
  let(:messenger) {double :messenger, send: nil}
  let(:list_menu) {"Pollo, $5"}
  let(:order) {double :order, total: 15.50}
  let(:selected_dishes) do {:chicken => 3, :meatballs =>4} end
  it 'shows the menu with the dishes and prices' do
    expect(takeaway.show_menu).to eq list_menu
  end

  it 'allows the customer to select dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(selected_dishes)
  end

  it 'presents the order total amount' do
    allow(order).to receive(:add)
    total = takeaway.place_order(selected_dishes)
    expect(total).to eq 15.50
  end

  context 'when the order has been placed' do
    it 'sends a confirmation text messenger' do
      allow(order).to receive(:add)
      expect(messenger).to receive(:send)
      takeaway.place_order(selected_dishes)
    end
  end
end
