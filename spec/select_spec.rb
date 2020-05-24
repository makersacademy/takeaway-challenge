require 'select'

describe Select do
  let(:item) { double :item }
  let(:quantity) { double :quantity }

  context "#selection" do
    it "should respond to the method order with 2 arg" do
      expect(subject).to respond_to(:order).with(2).argument
    end

    it "should push meal items into the basket" do
      subject.order(item, quantity)
      expect(subject.basket).to eq({item: quantity})
    end

    # it "should be an instance of menu" do
    #   # subject.basket(meal, price)
    #   # expect(subject.order).to be_an_instance_of
    # end
  end
end
