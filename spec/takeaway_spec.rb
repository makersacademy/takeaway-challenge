require 'takeaway'

describe Takeaway do
  # Mocking and stubing other classes
  before do
    @menu = double(:menu)
    @dish = double(:dish)
    @order = double(:order)
    @text = double(:text)
    allow(@menu).to receive(:read).and_return({ @dish => 10 })
  end

  subject(:takeaway) {Takeaway.new(@menu,@order,@text)}

  it 'reads a menu' do
    expect(takeaway.menu).to eq ({@dish => 10})
  end

  describe "#takes order" do
    before do
      allow(@order).to receive(:add_order).and_return([@dish, 1])
      allow(@order).to receive(:basket).and_return([@dish])
    end
    it "adds order to basket" do
      expect do
        takeaway.add_order(@dish, 1)
      end.to output("1x #{@dish}(s) is added to your basket").to_stdout
      expect(takeaway.basket[-1]).to be @dish
    end

    it "sends confirmation text when checkout" do
      allow(@order).to receive(:checkout).and_return([@dish, 1])
      allow(@order).to receive(:total).and_return(10)
      takeaway.add_order(@dish, 1)
      expect do
        takeaway.checkout
      end.to output("Your total order is £10").to_stdout
    end
  end
end
