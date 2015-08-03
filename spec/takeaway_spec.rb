require 'takeaway'
require 'menu'

describe Takeaway do
  let(:x) { {"pizza"=>3, "curry"=>4, "chopsuey"=>2} }
  describe '#menu' do
    let(:x) { {"pizza"=>3, "curry"=>4, "chopsuey"=>2} }
    it { is_expected.to respond_to(:menu) }
    it "should provide a menu listing dishes" do
      expect(subject.menu).to eq x
    end
  end
  describe '#order' do
    it { is_expected.to respond_to(:order).with(2).argument  }
    it "receives an order" do
      subject.order("pizza", 3)
      expect(subject.final_order).to_not be_empty
    end
    it 'raises error if ordering something not on menu' do
      expect { subject.order("carbonara", 3)}.to raise_error 'That is not on the menu!'
    end
  end
  describe "#cost" do
    it { is_expected.to respond_to(:cost)}
    it "calculate total cost of order" do
      subject.order("pizza", 1)
      subject.order("curry", 1)
      #expect(subject.cost).to eq 7
    end
  end
end
