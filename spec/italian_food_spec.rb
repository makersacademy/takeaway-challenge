require 'italian_menu'

describe ItalianMenu do
  subject(:italian_menu) {described_class.new}

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

    it 'returns dishes for the meal specified in menu class - default dinner' do
      puts italian_menu.dinner
      expect(italian_menu.dishes).to eq(italian_menu.dinner)
    end

  end



end
