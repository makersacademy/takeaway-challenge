require 'takeaway'
require 'checkout'

describe Checkout do
before (:each) do
  @takeaway = Takeaway.new
  @takeaway.add_to_basket('bibimbap', 3)
  @checkout_total = @takeaway.order_total
  @checkout = Checkout.new(@checkout_total)
end
  it 'accepts an argument of a float' do
    expect(@checkout.total).to eq(31.5)
  end
  describe 'final_total' do
    it 'displays the final total' do
      expect { @checkout.final_total }.to output("£31.50\n").to_stdout
    end
  end
end
