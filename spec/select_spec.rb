require 'select'

describe Select do
  let(:final_order) { [{ toast: 3, cereal: 2 }] }
  let(:available_dishes) { double :available_dishes }
  let(:menu) { [{ toast: 3, cereal: 2, coffee: 2 }] }

  context "#selection" do
    it "should respond to the method order with 1 arg" do
      expect(subject).to respond_to(:order).with(1).argument
    end

    it "should receive dishes from Dishes class" do
      expect(subject.order(available_dishes)).to match_array(menu)
    end
  end
end
