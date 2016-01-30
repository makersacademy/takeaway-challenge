require 'menu'

describe Menu do
  let(:dummy_cuisine_klass) {double :dummy_cuisine_klass}
  let(:italian_menu) {double :italian_menu}
  let(:dinner) {double :dinner}
  let(:main) {double :main}
  subject(:menu) {described_class.new dummy_cuisine_klass}
  let(:default_menu_dinner_mains) {{ Mains: 'Price', Margherita: 13, Pasta: 12, Risotto: 11, Calzone: 10, Carbonara: 12, Bolognese: 12, Gnocchi: 11 }}



  describe '#initialize' do

    it 'has the default cuisine choice of ItalianFood' do
      expect(menu.cuisine_choice).to eq dummy_cuisine_klass
    end

    it 'has a selection array' do
      expect(menu.selection).to be_a Array
    end

    it 'leaves that selection array empty as default' do
      expect(menu.selection).to be_empty
    end

  end

context "Choosing and displaying menus"

    describe '#menu_choice' do

      before do
        allow(dummy_cuisine_klass).to receive(:new).and_return(italian_menu)
        allow(italian_menu).to receive(:dishes).and_return(sample_menu)
      end

      it 'will raise error "We only serve lunch and dinner" if another meal is asked for' do
        expect{menu.menu_choice(:breakfast)}.to raise_error("We only serve lunch and dinner")
      end

      it 'will raise error "Please choose starter, main or dessert" if another meal is asked for' do
        expect{menu.menu_choice(:dinner, :snack)}.to raise_error("Please choose starter, main, dessert or 'all'")
      end

      it 'selects a menu according to meal and course' do
        expect(menu.menu_choice).to eq italian_menu
      end

    describe '#display' do

      before do
        allow(italian_menu).to receive(:dishes).and_return(default_menu_dinner_mains)
      end

      it {is_expected.to respond_to(:display)}

      it 'displays the dishes and prices of the ItalianMenu, defaulted to Dinner/Mains' do
        expect(menu.display).to eq default_menu_dinner_mains
      end

    end
  end

end

# expect(dummy_journey).to receive(:finish).with(exit_station)
# log.end_journey(exit_station)
