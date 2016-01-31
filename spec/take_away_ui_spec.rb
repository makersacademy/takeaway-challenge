require 'take_away_ui'

describe TakeAway do

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

    it 'has a selection array' do
      expect(menu.selection).to be_a Array
    end

    it 'has an empty selection array as default' do
      expect(menu.selection).to be_empty
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


      before do
        allow(italian_menu).to receive(:each)
      end

      it 'displays the dishes and prices of the ItalianMenu, defaulted to Dinner/Mains' do
        expect(menu.display).to eq default_menu_dinner_mains
      end

    end
  end
end

  context 'Submiting orders by text or selecting and adding to basket individually' do
    let(:test_order) {"2 carbonara, 1 tiramisu and I dunno"}
    let(:selection1) {["Cake",3]}
    let(:selection2) {["Tiramisu", 1]}


    before do
      allow(STDOUT).to receive(:p).with("What would you like to eat? Eg '2 Carbonara and a Tiramisu'")
      allow(STDIN).to receive(:gets).and_return(test_order)
      allow(dummy_order_klass).to receive(:new).with(test_order, default_menu_dinner_mains).and_return(dummy_order)
      allow(dummy_basket_klass).to receive(:new).with([selection1], italian_menu).and_return(dummy_basket)
    end

    describe '#take_order' do

      before do
        allow(dummy_order).to receive(:add_to_basket)
      end


      it 'instantiates a new order' do
        expect(dummy_order_klass).to receive(:new).and_return(dummy_order)
        menu.take_order
      end

      it 'adds the order to basket' do
        expect(dummy_order).to receive(:add_to_basket)
        menu.take_order
      end

    end

  describe '#select_dish' do
      it {is_expected.to respond_to(:select_dish).with(2).arguments}


      before do
        allow(dummy_basket).to receive(:selection).and_return([[selection1]])
        allow(dummy_basket_klass).to receive(:new).with(menu.selection, default_menu_dinner_mains).and_return(dummy_basket)
        menu.select_dish("Cake", 3)
      end

      it 'puts dish selections into selection1 array' do
        expect(menu.selection).to include selection1
      end

      it 'instantiates a new basket on first selection' do
        expect(menu.basket).to eq dummy_basket
      end

      it 'puts dish selections into selection array' do
        menu.select_dish("Tiramisu", 1)
        expect(menu.basket.selection).to include selection2
      end

      it 'does not instantiate a new basket on second selections' do
        menu.select_dish("Tiramisu", 1)
        expect(menu.basket).to eq dummy_basket
      end

      it 'selecting dishes increases the size of selection array' do
        expect {menu.select_dish("Tiramisu", 1)}.to change{menu.basket.selection.size}.by(1)
      end



      describe "#review_order" do
        let(:sample_bill) {double :sample_bill}
        let(:sample_total) {double :sample_total}

        before do
          allow(dummy_basket).to receive(:itemised_bill).and_return sample_bill
          allow(sample_bill).to receive(:each)
          allow(dummy_basket).to receive(:total_bill).and_return sample_total
        end

        it 'will retrieve the itemised_bill' do
          expect(dummy_basket).to receive(:itemised_bill).and_return sample_bill
          menu.review_order
        end

        it 'will retrieve the total_bill' do
          expect(dummy_basket).to receive(:total_bill).and_return sample_total
          menu.review_order
        end
      end


    describe "#confirm_order" do
      let(:price) {double :price}
      let(:sample_total) {double :sample_total}

      before do
        allow(dummy_basket).to receive(:total_bill).and_return price
        allow(dummy_basket).to receive(:checkout)
      end


      it 'Stores the customer\'s expected price' do
        menu.confirm_order(price)
        expect(menu.price).to eq price
      end

      it 'checks the price against the total_bill' do
        expect(dummy_basket).to receive(:total_bill)
        menu.confirm_order(price)
      end

      it 'raises error "Price does not match" if there is not a match.' do
        expect{menu.confirm_order(sample_total)}.to raise_error("Price does not match")
      end

      it 'does not raise an error if prices match' do
        allow(dummy_basket).to receive(:total_bill).and_return sample_total
        expect{menu.confirm_order(sample_total)}.not_to raise_error
      end

      it 'checks-out the basket if prices match' do
        expect(dummy_basket).to receive(:checkout)
        menu.confirm_order(price)
      end


    end


  end
  end

end
