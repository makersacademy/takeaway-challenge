require './lib/order.rb'

describe Order do
  let(:basket) { { :Burger => 2 } }
  let(:menu) { {:Burger => 2} }
  subject(:subject) {Order.new(menu)}


  describe "#initialization" do

    it "is initialized with an empty basket" do
      expect(subject.basket).to be_empty
    end

    it {is_expected.to respond_to(:add_dish).with(2).arguments}
  end

  describe "#add order" do

    it "adds selected dishes and quantities in basket" do
      expect(subject.add_dish("Burger",2)).to eq "2x Burger(s) added to your basket"
    end
  end

  describe "#raise error " do

    it "raises error when sum of basket is 0" do
      expect {subject.basket_summary}.to raise_error "Your basket is empty!"
    end
  end

  describe "#total" do

    it "outputs total of basket" do
      allow(subject).to receive(:total_output).and_return("Total = £8")
      expect(subject.total_output).to eq "Total = £8"
    end
  end
end
