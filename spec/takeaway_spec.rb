require 'takeaway'

  describe Takeaway do
  let(:dishes) { double }
  let(:total_cost) { 0 }
  subject { Takeaway.new(dishes) }
  
  describe '#read_menu' do
    it "returns the dishes" do
      expect(subject.read_menu).to eq dishes
  end
end
  
  describe '#basket' do
    it "should have an empty basket" do 
     expect(subject.basket).to eq Hash.new
    end
  end



  describe "#order" do 
      it { is_expected.to respond_to(:order).with(2).arguments }
  end

  describe "#basket_summary" do
  it "shows what's currently in the basket" do
  expect(subject.basket_summary).to eq subject.basket
  end
end

describe "#basket_price" do
  it "calculates the total cost of the basket" do
    expect(subject.basket_price).to eq total_cost
  end
end

end 

