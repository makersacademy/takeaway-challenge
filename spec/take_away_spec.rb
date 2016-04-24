require 'take_away'

describe TakeAway do
  subject(:takeaway) {described_class.new(menu: menu, order: order, messenger: messenger, config: {})}

  let(:menu) {double :menu, list_menu: list_menu}
  let(:messenger) {spy :messenger, send: nil}
  let(:list_menu) {"Pollo, $5"}
  let(:order) {double :order, total: 15.50}
  let(:selected_dishes) do {:chicken => 3, :meatballs =>4} end

  describe '# show_menu' do
    it 'Shows the menu with the dishes and prices' do
      expect(takeaway.show_menu).to eq list_menu
    end
  end

  describe '# place_order' do
    it 'Allows the customer to select dishes' do
      expect(order).to receive(:add).twice
      takeaway.place_order(selected_dishes)
    end

    it 'Presents the order total amount' do
      allow(order).to receive(:add)
      total = takeaway.place_order(selected_dishes)
      expect(total).to eq 15.50
    end

    context 'When the order has been placed' do
      it 'Sends a confirmation text messenger' do
        allow(order).to receive(:add)
        takeaway.place_order(selected_dishes)
        expect(messenger).to have_received(:send)
      end
    end
  end
end
