require 'italian_menu'

describe ItalianMenu do
  subject(:italian_menu) {described_class.new}
  let(:lunch_desserts) {{ Desserts: 'Price', Pannacotta: 7, Semi_fresso: 7, Tiramisu: 10}}
  let(:dinner_starters) {{ Starters: 'Price', Calamari: 8, Olives: 4, Panzerottini: 7, Bruschetta: 6, Gamberi: 9, Insalata: 7 }}
  describe "#Initialize" do

    it {is_expected.to respond_to(:meal)}

    it {is_expected.to respond_to(:course)}

    it 'has dinner as default meal option' do
      expect(italian_menu.meal).to eq :dinner
    end

    it 'has all as default course option' do
      expect(italian_menu.course).to eq :all
    end
  end

  describe "#dishes" do

    it 'always returns a hash of dishes and prices' do
      expect(italian_menu.dishes).to be_a Hash
    end

    it 'returns dishes for the meal specified in menu class - default dinner/all' do
      expect(italian_menu.dishes).to eq(italian_menu.dinner)
    end
  end

    context "returns just the lunch dessert menu" do
      subject(:italian_menu_lunch) {described_class.new :lunch, :dessert}

      it 'returns just the lunch dessert menu' do
        expect(italian_menu_lunch.dishes).to eq (lunch_desserts)
      end
    end

    context "returns just the dinner starter menu" do
      subject(:italian_menu_dinner) {described_class.new :dinner, :starter}

      it 'returns just the lunch dessert menu' do
        expect(italian_menu_dinner.dishes).to eq (dinner_starters)
      end


    end





end
