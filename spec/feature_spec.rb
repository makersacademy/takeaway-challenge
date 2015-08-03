require 'takeaway'
require 'menu'

 describe "Features" do
   let(:takeaway) { Takeaway.new }
   let(:x) { {"pizza"=>3, "curry"=>4, "chopsuey"=>2} }

  describe "Takeaway" do
    describe "#dishes" do
      it { expect(takeaway).to respond_to(:menu) }
      it "should provide a menu listing dishes" do
        expect(takeaway.menu).to eq x
      end
    end
    describe "#order" do
      it { expect(takeaway).to respond_to(:order).with(2).argument }
      it "receives an order" do
        takeaway.order("pizza", 3)
        expect(takeaway.final_order).to_not be_empty
      end
      it 'raises error if ordering something not on menu' do
        expect { takeaway.order "carbonara", 3}.to raise_error 'That is not on the menu!'
      end
    end
    describe "#cost" do
      it { expect(takeaway).to respond_to(:cost)}
      it "calculate total cost of order" do
        takeaway.order("pizza", 1)
        takeaway.order("curry", 1)
        #expect(takeaway.cost).to eq 7
      end
    end
  end
end
