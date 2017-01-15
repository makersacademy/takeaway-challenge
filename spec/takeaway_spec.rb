require 'takeaway'

describe TakeAway do

dishes = {"Crab" => 8.50, "Curry" => 9,"Soup" => 10.32, "Sandwich" => 12, "Steak" => 20}

describe '#read_menu' do
  it {is_expected.to respond_to(:read_menu)}
  it 'should return the menu' do
    expect(subject.read_menu).to eq dishes
  end
end

  describe '#order' do
    it {is_expected.to respond_to(:order).with(2)}
    it 'return a message of quantity and dish added to basket' do
      expect(subject.order("Steak", 3)).to eq "3x Steak(s) added to your basket."
    end
  end

  describe '#basket_summary' do
    it {is_expected.to respond_to(:basket_summary)}

    it 'return the basket summary' do
      subject.order("Curry", 2)
      message = "Curry x2 = £18"
      expect(subject.basket_summary).to eq message
    end
  end

  describe '#total_price' do
    it {is_expected.to respond_to(:total_price)}
    it 'should return the total price of all the dishes ordered' do
      subject.order("Curry", 3)
      subject.order("Soup", 2)
      subject.order("Sandwich", 4)
      expect(subject.total_price).to eq "Total: £95.64"
    end
  end

  describe '#complete_order' do
    it {is_expected.to respond_to(:complete_order)}
    it 'raise an error if customer_total is different from total_price' do
      subject.order("Curry", 3)
      subject.order("Soup", 2)
      error = "The total you enter does not match checkout"
      expect {subject.complete_order(28)}.to raise_error error
    end
  end
end
