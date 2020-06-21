require './lib/order'
require './lib/takeaway'

describe Order do
  subject(:order) {Order.new}
  let(:dish1) { double :'Chow mein', dish: 'chow mein', price: '3' }
  let(:dish2) { double :'Egg fried rice', dish: 'egg fried rice', price: '2' }

  describe "new order" do
    it "checks a new order is made" do
      expect(order).to be_an_instance_of(Order)
    end
  end
    describe "add items" do
        takeaway = Takeaway.new
        it { is_expected.to respond_to(:add).with(2).argument }
        #expect(subject.add).to eq"chicken_chow_mein"
    end
    describe "total of order" do
      it "calculates the sum of the order" do
        subject.add(dish1, 3)
        #how to use doubles for adding arguments
        subject.add(dish2, 2)
        expect(subject.total).to eq 5 
      end
    end
end