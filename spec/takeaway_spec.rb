require 'takeaway'

describe TakeAway do

#id: "1", name: "delicious", price: 2.00
  let(:menu) { double :menu, generator: list }
  let(:list) { double :list }
  subject(:takeaway) { described_class.new(menu)}

      it 'shows the menu with the dishes and prices' do
        expect(takeaway.get_menu).to eq list
      end

   describe ' #select_dish' do
      it 'select dish' do
        allow(menu).to receive(:list).and_return menu
         takeaway.select(:id)
        expect(takeaway.basket[0]).to eq menu
      end
    end

    describe ' #checks total' do
      it 'shows total amount of order' do
        allow(menu).to receive(:list).and_return menu
         takeaway.select(1)
         p takeaway.basket
        expect(takeaway.checkout).to eq menu[0][:price]
      end
    end

    describe ' #order' do
      it 'complete order' do
        expect(takeaway.order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
      end
    end
end
