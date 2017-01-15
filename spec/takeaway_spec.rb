require 'takeaway'

describe TakeAway do

dishes = {"Crab" => 8.50, "Curry" => 9,"Soup" => 10.32, "Sandwich" => 12, "Steak" => 20}

describe '#read_menu' do
  it 'should return the menu' do
    expect(subject.read_menu).to eq dishes
  end
end

  describe '#order' do
    it 'return a message of quantity and dish added to basket' do
      expect(subject.order("Steak", 3)).to eq "3x Steak(s) added to your basket."
    end
  end

  describe '#basket_summary' do
    it 'return the basket summary' do
      subject.order("Curry", 2)
      message = "Curry x2 = £18"
      expect(subject.basket_summary).to eq message
    end
  end

  describe '#total_price' do
    it 'should return the total price of all the dishes ordered' do
      subject.order("Curry", 3)
      subject.order("Soup", 2)
      subject.order("Sandwich", 4)
      expect(subject.total_price).to eq "Total: £95.64"
    end
  end

  describe '#complete_order' do
    it 'raise an error if customer gives a different total from checkout' do
      subject.order("Curry", 3)
      subject.order("Soup", 2)
      error = "The total you enter does not match checkout"
      expect {subject.complete_order(28)}.to raise_error error
    end
  end
end
