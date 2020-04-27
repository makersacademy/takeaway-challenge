require 'takeaway'

describe TakeAway do

  let(:menu) { double :menu, generator: user_list, list: list }
  let(:user_list) { double :user_list }
  let(:list) {double :list}
  let(:list_number) { double :list_number }
  let(:value) { double :value }
  let(:dish) {double :dish }
  let(:basket) {double :basket}

  subject(:takeaway) { described_class.new(menu, basket)}

      it ' #gets_menu' do
        expect(takeaway.gets_menu).to eq user_list
      end

      it ' #adds dish and quantity from the menu' do
        allow(list).to receive(:[]).and_return dish
        expect(basket).to receive(:adding).with(dish, value)
        takeaway.adds(list_number, value)
      end

      it ' #checks_out calculating the sum of order' do
        expect(basket).to receive(:total)
        takeaway.checks_out
      end


    describe ' #order' do
      it 'complete order' do
        expect(takeaway.order).to eq "Thank you! Your order was placed and will be delivered before 18:52"
      end
    end
end
