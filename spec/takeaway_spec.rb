require 'takeaway'

describe Takeaway do
  let(:dishes) {double}

  describe '#basket' do
    it "should have an empty basket" do 
     expect(subject.basket).to eq Hash.new
    end
  end

  describe "#order" do 
    it "adds food and amount to basket" do
      subject.order
    end
  end

end
