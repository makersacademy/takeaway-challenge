require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish) do
    { "curry" => 1.00,
    "xcurry" => 1.00 }
  end
  subject(:total) { takeaway.basket.values.sum }

  describe '#Basket tests'do
    it 'starts with an empty basket' do
      # expect(takeaway.basket).to be_empty
      expect(takeaway.basket).to be_an_instance_of Hash
    end
    it "deletes current basket to start order again" do
      takeaway.select_dish("curry", 1)
      expect(takeaway.empty_basket).to be_an_instance_of Hash
    end
  end

  describe '#Menu tests' do
    it 'has a list of dishes' do
      expect(takeaway.menu).to be_an_instance_of(Dishes)
    end
  end

  it 'prints a list of dishes' do
    expect(takeaway.print_menu).to include(dish)
  end

  describe '#Selection tests' do
    before do
      takeaway.select_dish("curry", 1)
    end
    it 'selects from the menu' do
      expect(takeaway.basket).to include "curry"
    end
  end

  it "adds up the total of all dishes" do
    takeaway.select_dish("curry", 1)
    takeaway.select_dish("xcurry", 1)
    expect(takeaway.total).to eq total
  end

  describe '#Total and Order tests' do
    context 'dishes have been selected'
    before do
      takeaway.select_dish("curry", 1)
      takeaway.select_dish("xcurry", 1)
    end
    it 'places and order' do
      total = takeaway.basket.values.sum
      expect(takeaway.place_order(total)).to eq "Thank you! Your order with a total of #{total} has been confirmed"
    end
    it 'raises and error if incorrect confirmed total' do
      expect{takeaway.place_order(3)}.to raise_error "total is not correct, unable to secure order"
    end

  end

end
