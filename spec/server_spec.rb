require 'server'

describe Server do
  subject(:server) do
    described_class.new(menu_klass, cuisine_klass, price_calculator_klass)
  end
  let(:dish) {double :dish, name: "Chow Mein", price: 3.99}
  let(:menu_klass) {double :menu_klass, new: menu}
  let(:menu) do
    double :menu,
    view_prices: price_list,
    price_list: {dish.name => dish.price},
    add_dishes: [dish],
    make_order: price_calculator,
    selected_dishes: {dish => 1}
  end
  let(:cuisine_klass) {double :cuisine_klass, new: cuisine}
  let(:cuisine) {double :cuisine, create_dishes: dish, dishes: [dish]}
  let(:price_calculator_klass) do
    double :price_calculator_klass, new: price_calculator
  end
  let(:price_calculator) do
    double :price_calculator, price: 3.99, grand_total: 3.99
  end
  let(:price_list) {double :price_list}
  let(:chinese) {double :cuisine}

  context 'producing the desired the cuisine' do
    describe '#request_cuisine' do
      it 'instantiates cuisine' do
        expect(cuisine_klass).to receive(:new)
        server.request_cuisine(chinese)
      end
      it 'calls the cuisine\'s create_dishes method' do
        expect(cuisine).to receive(:create_dishes)
        server.request_cuisine(chinese)
      end
    end
  end

  context 'creating the menu' do
    describe '#create_menu' do
      before do
        server.request_cuisine(chinese)
      end
      it 'instantiates the price_calculator' do
        expect(price_calculator_klass).to receive(:new)
        server.create_menu
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

  context 'working with a generated menu' do
    before do
      server.request_cuisine(chinese)
      server.create_menu
    end
    context 'presenting the menu to the customer' do
      describe '#present_menu' do
        it 'puts a human readable view of the dishes and prices.' do
          expect(STDOUT).to receive(:puts).with("Chow Mein --- £3.99")
          server.present_menu
        end
      end
    end

    context 'taking the order' do
      describe '#take_order' do
        it 'calls the menu\'s make_order method' do
          expect(menu).to receive(:make_order)
          server.take_order
        end
      end
    end

    context 'checking the total' do
      describe '#total' do
        it 'totals up the cost of the customer\'s order' do
          server.total
          expect(server.order_total).to equal(price_calculator.price)
        end

        it 'raises an error if the order total is incorrect' do
          allow(price_calculator).to receive(:grand_total) {5}
          expect{server.total}.to raise_error "Order Total incorrect."
        end
      end
    end
  end
end
