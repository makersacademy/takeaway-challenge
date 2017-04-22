require 'restaurant'

describe Restaurant do

  menu = Restaurant::MENU

  it 'reads the menu to the user.' do
    expect(subject.read_menu).to eq menu
  end

  describe '#order' do

    it 'adds an item to your order' do
      expect(subject.order("dumplings",1)).to eq "Added 1 dumplings(s) to your order."
    end

    it 'raises an error if the dish is not on the menu' do
      expect { subject.order("shoe laces", 1).to raise_error "We are all out of shoe laces! What else would you like?" }
    end

    it 'checks if the dish is available' do
      expect(subject.dish_available?('chips')).to be(true)
    end

    it "has an empty basket by default" do
      expect(subject.basket).to eq []
    end

    it "total is empty by default" do
      expect(subject.subtotal).to eq []
    end

    it 'adds your order to basket' do
      subject.order('chips',1)
      expect(subject.basket).to include('chips')
    end

    it 'adds up the total order value' do
      subject.order('chips',1)
      expect(subject.get_total).to eq 2
    end

  end

end
