require 'order'
describe Order do
  let(:dummy_order) {double :dummy_order}
  let(:dummy_basket_klass) {double :dummy_basket_klass}
  let(:dummy_basket) {double :dummy_basket}
  let(:test_order) {"2 carbonara, 1 margherita, a risotto I dunno"}
  let(:menu_choice) {{ Mains: 'Price', Margherita: 13, Pasta: 12, Risotto: 11, Calzone: 10, Carbonara: 12, Bolognese: 12, Gnocchi: 11 }}
  subject(:order) {described_class.new test_order, menu_choice, dummy_basket_klass}

  describe "#initialize" do

    it 'receives user_input from TakeAwayUI' do
      expect(order.user_input).to eq test_order
    end

    it 'receives menu_choice from TakeAwayUI' do
      expect(order.menu_choice).to eq menu_choice
    end

    it 'has an uninitialized Basket class' do
      expect(order.basket).to eq dummy_basket_klass
    end

  end

  describe "#process_order_dishes" do


    it 'returns an array of user input\'s order' do
      expect(order.process_order_dishes).to be_a Array
    end

    it 'returns an array of symbols of names of dishes' do
      expect(order.process_order_dishes).to include :Carbonara
      expect(order.process_order_dishes).to include :Margherita
      expect(order.process_order_dishes).to include :Risotto
    end

    it 'does not return any symbols that are not dishes in chosen menu' do
      expect(order.process_order_dishes).not_to include :Dunno
    end
  end

  describe "#process_order_quantities" do

    it 'returns an array of user input\'s order' do
      expect(order.process_order_quantities).to be_a Array
    end

    it 'returns an array of numbers' do
      expect(order.process_order_quantities).to include Integer
    end

    it 'translates "a" or "A" to 1' do
      expect(order.process_order_quantities).to eq [2, 1, 1]
    end
  end

  describe "#submission" do

    it 'returns a multidimensional array of dishes and quantities' do
      expect(order.submission).to include [:Carbonara, 2]
      expect(order.submission).to include [:Margherita, 1]
      expect(order.submission).to include [:Risotto, 1]
    end
  end

  describe "#add_to_basket" do
    let(:dummy_selection) {[[:Carbonara, 2], [:Margherita, 1], [:Risotto, 1]]}
    let(:dummy_selection2) {[[:Pasta, 2]]}

    before do
      allow(dummy_basket_klass).to receive(:is_a?).and_return false
      allow(dummy_basket_klass).to receive(:new).with(dummy_selection, menu_choice).and_return dummy_basket
      allow(dummy_basket).to receive(:selection)
    end

    it 'will initialize a new basket if one does not already exist' do
      expect(dummy_basket_klass).to receive(:new).and_return(dummy_basket)
      order.add_to_basket
    end

    it 'will add selection to the basket' do
      order.add_to_basket
      expect(dummy_basket).to receive(:selection).and_return(dummy_selection)
      order.basket.selection
    end

    it 'will add selection2 to the basket' do
      order.add_to_basket
      expect(dummy_basket).to receive(:selection).and_return(dummy_selection2)
      order.basket.selection
    end


  context 'Adding to existing basket' do

    before do
      allow(dummy_basket).to receive(:is_a?).with(dummy_basket_klass)
      allow(dummy_basket).to receive(:new).with(dummy_selection, menu_choice)
      allow(dummy_basket).to receive(:selection).and_return(dummy_selection)
      order.add_to_basket
    end

    it 'will check that there is no basket there already' do
      expect(dummy_basket).to receive(:==).and_return false
      order.add_to_basket
    end


    it 'will not initialize a new basket if one already exists' do
      expect(dummy_basket).not_to receive(:new)
      order.add_to_basket
    end


    it 'will add selection to existing basket items' do
      expect(dummy_basket).to receive(:selection).and_return dummy_selection2
      order.basket.selection
    end

    end
  end
end
