require './lib/restaurant.rb'

describe Restaurant do

  let(:order) {double :order, empty?: false}
  subject(:subject) { Restaurant.new(order) }

  describe "#initialization" do

    it "is initialized with an order" do
      expect(subject).to respond_to :order
    end
  end

  it "checks if given total equals to order's total" do
    allow(order).to receive(:total).and_return(35)
    expect(subject.total_correct(35)).to eq true
  end

  it "knows the list of ordered dishes" do
    allow(order).to receive(:basket).and_return({:coke => 1})
    expect(subject.basket_list).to eq ({:coke =>1})
  end

  describe "#raise error" do

    it "can not place an order if it is empty" do
      expect{subject.place_order({}, 0)}.to raise_error "Order is empty"
    end

    # it"can not place an order if total is wrong" do
    #   allow(order).to receive(:total).and_return(35)
    #   allow(order).to receive(:basket).and_return({:coke => 1})
    #   expect(subject.place_order({Burger:2}),35)
    # end
  end
end
