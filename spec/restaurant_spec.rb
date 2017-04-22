require 'restaurant'

describe Restaurant do

  menu = Restaurant::MENU

  it 'reads the menu to the user.' do
    expect(subject.read_menu).to eq menu
  end

  describe '#order' do
    it 'adds an item to your order' do
      expect(subject.order("dumplings")).to eq "Added 1 x dumplings to your order."
    end

    it 'raises an error if the dish is not on the menu' do
      expect { subject.order("shoe laces").to raise_error "We are all out of shoe laces! What else would you like?" }
    end

    it 'checks if the dish is available' do
      expect(subject.dish_available?('chips')).to be(true)
    end

    it "has an empty basket by default" do
      expect(subject.basket).to eq []
    end

    it 'adds your order to basket' do
      subject.order('chips')
      expect{subject.order('chips')}.to change(subject.basket.length).by(1)
    end
  end

end
