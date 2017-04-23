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

    it 'tells you your order has been placed if right amount given' do
      subject.order('chips',1)
      subject.basket_summary
      expect(subject.place_order(2)).to eq "Thank you! Your order was placed and will be delivered in the next 30 minutes."
    end

    it 'tells you the wrong amount has been given and no order is placed' do
      expect(subject.place_order(3)).to eq "Please pay the exact total to place your order."
    end

  end

end
