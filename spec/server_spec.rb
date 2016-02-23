require 'server'

describe Server do
  subject(:server) {described_class.new(menu_klass, cuisine_klass)}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:menu) do
    double :menu,
    view_prices: price_list,
    price_list: {dish.name => dish.price},
    add_dishes: [dish]
  end
  let(:cuisine_klass) {double :cuisine_klass, new: cuisine}
  let(:cuisine) {double :cuisine, create_dishes: dish, dishes: [dish]}
  let(:dish) {double :dish, name: "Chow Mein", price: 3.99}
  let(:price_list) {double :price_list}

  context 'producing the desired the cuisine' do
    describe '#request_cuisine' do
      it 'asks for a cuisine type from the user' do
        expect(STDOUT).to receive(:puts).with("What cuisine would you like?")
        server.request_cuisine
      end
      it 'instantiates cuisine' do
        expect(cuisine_klass).to receive(:new)
        server.request_cuisine
      end
      it 'calls the cuisine\'s create_dishes method' do
        expect(cuisine).to receive(:create_dishes)
        server.request_cuisine
      end
    end
  end

  context 'creating the menu' do
    describe '#create_menu' do
      before do
        server.request_cuisine
      end
      it 'instantiates the menu' do
        expect(menu_klass).to receive(:new)
        server.create_menu
      end
      it 'passes the dishes to the menu' do
        expect(menu).to receive(:add_dishes).and_return({dish.name => dish.price})
        server.create_menu
      end
    end
  end

  context 'presenting the menu to the customer' do
    describe '#present_menu' do\
      before do
        server.request_cuisine
        server.create_menu
      end
      it 'puts a human readable view of the dishes and prices.' do
        expect(STDOUT).to receive(:puts).with("Chow Mein --- £3.99")
        server.present_menu
      end
    end
  end
end
