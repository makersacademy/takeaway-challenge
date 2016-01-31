require 'menu'

describe Menu do

  #Doubling cuisine class
  let(:dummy_cuisine_klass) {double :dummy_cuisine_klass}
  subject(:menu) {described_class.new dummy_cuisine_klass, dummy_order_klass, dummy_basket_klass}
  let(:italian_menu) {double :italian_menu}
  let(:dinner) {double :dinner}
  let(:main) {double :main}
  let(:default_menu_dinner_mains) {{ Mains: 'Price', Margherita: 13, Pasta: 12, Risotto: 11, Calzone: 10, Carbonara: 12, Bolognese: 12, Gnocchi: 11 }}

  #Doubling order class
  let(:dummy_order_klass) {double :dummy_order_klass}
  let(:dummy_order) {double :dummy_order}

  #Doubling basket class
  let(:dish) {double :dish}
  let(:quantity) {double :quantity}
  let(:dummy_basket_klass) {double :dummy_basket_klass}
  let(:dummy_basket) {double :dummy_basket}


before do
  allow(dummy_cuisine_klass).to receive(:new).and_return(italian_menu)
  allow(italian_menu).to receive(:dishes).and_return(default_menu_dinner_mains)
end

  describe '#initialize' do

    it 'has the default cuisine choice of ItalianFood' do
      expect(menu.cuisine_choice).to eq dummy_cuisine_klass
    end

    it 'has an uninstantiated Order object' do
      expect(menu.order).to eq dummy_order_klass
    end

    it 'has an uninstantiated Basket object' do
      expect(menu.basket).to eq dummy_basket_klass
    end

  end

  context "Choosing and displaying menus" do

    describe '#menu_choice' do

      it 'will raise error "We only serve lunch and dinner" if another meal is asked for' do
        expect{menu.menu_choice(:breakfast)}.to raise_error("We only serve lunch and dinner")
      end

      it 'will raise error "Please choose starter, main or dessert" if another meal is asked for' do
        expect{menu.menu_choice(:dinner, :snack)}.to raise_error("Please choose starter, main, dessert or 'all'")
      end

      it 'returns a hash of the dishes selected with menu_choice' do
        expect(menu.menu_choice).to be_a Hash
      end

      it 'selects a menu according to meal and course' do
        expect(menu.menu_choice).to eq default_menu_dinner_mains
      end


    describe '#display' do


      it {is_expected.to respond_to(:display)}

      it 'displays the dishes and prices of the ItalianMenu, defaulted to Dinner/Mains' do
        expect(menu.display).to eq default_menu_dinner_mains
      end

    end
  end
end

  context 'Submiting orders by text or selecting and adding to basket individually' do
    let(:test_order) {"2 carbonara, 1 tiramisu and I dunno"}

    before do
      allow(STDOUT).to receive(:p).with("What would you like to eat?")
      allow(STDIN).to receive(:gets).and_return(test_order)
      allow(dummy_order_klass).to receive(:new).with(test_order, default_menu_dinner_mains).and_return(dummy_order)
      allow(dummy_basket_klass).to receive(:new).with(dish, quantity).and_return(dummy_basket)
    end

    describe '#take_order' do

      it {is_expected.to respond_to(:take_order)}

      it 'instantiates a new order' do
        expect(menu.take_order).to eq dummy_order
      end

    end

  describe '#select_dish' do

      it {is_expected.to respond_to(:select_dish).with(2).arguments}

      it 'instantiates a new basket' do
        expect(menu.select_dish(dish, quantity)).to eq dummy_basket
      end

    end

  end

end

# expect(dummy_journey).to receive(:finish).with(exit_station)
# log.end_journey(exit_station)
