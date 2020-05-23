require 'select'

describe Select do
  let(:final_order) { [{ toast: 3, cereal: 2 }] }
  let(:available_dishes) { double :available_dishes }

  context "#selection" do
    it "should respond to the method order with 1 arg" do
      expect(subject).to respond_to(:order).with(1).argument
    end
  end
end
