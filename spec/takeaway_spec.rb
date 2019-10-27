require 'takeaway'

describe Takeaway do

  subject(:menu) { described_class.new }

  let(:dishes) do
    { "coffee" => 3.00, "coke" => 2.40,
      "pizza" => 8.50, "chicken" => 9.90,
      "fish" => 7.80, "burger" => 9.50 }
  end

  it 'displays a menu with dishes and prices' do
    expect(subject.dishes).to eq(dishes)
  end

  it 'prints out a list of dishes and prices' do
    expect(menu.print_menu).to eq(dishes)
  end

  describe '#order' do
    it 'should return a statement with order details' do
      expect(subject.order("coke", 2)).to eq("2x coke(s) has been added to your order")
    end
  end

  describe '#basket_summery' do
    it 'should return return the items in the basket with a total cost' do
      subject.order("pizza", 2)
      expect(subject.basket_summery).to eq([["pizza x2 = £17.00"]])
    end

    it 'should add more than one item to an order' do
      subject.order("pizza", 2)
      subject.order("chicken", 3)
      expect(subject.basket_summery).to eq([["pizza x2 = £17.00"], ["chicken x3 = £29.70"]])
    end
  end

  describe '#total' do
    it 'should return the total cost of an order' do
      subject.order("pizza", 2)
      subject.order("chicken", 3)
      expect(subject.total).to eq("Total: £46.70")
    end
  end

end
