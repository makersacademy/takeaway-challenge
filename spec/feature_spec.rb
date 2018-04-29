require 'takeaway'

describe ' Feature tests ' do

  let(:takeaway) { Takeaway.new }

  context 'add various items and confirm basket' do
    it "should add several items to basket and return the item receipt" do
      takeaway.add_to_basket(:panda_pop, 1)
      takeaway.add_to_basket(:spaghetti_hoops, 2)
      takeaway.add_to_basket(:rice_pudding, 2)
      takeaway.add_to_basket(:panda_pop, 1)
      expect(takeaway.receipt).to eq "panda_pop (x2) --- £2, spaghetti_hoops (x2) --- £2, rice_pudding (x2) --- £6, Total: £10.00"
    end
  end

end
