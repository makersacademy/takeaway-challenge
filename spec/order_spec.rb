require "order"
#returns the order and total amount
describe Order do

  first_order = {:burger=>{:portions=>1, :price=>10}}
  second_order = {:burger=>{:portions=>2, :price=>10}, :salad=>{:portions=>2, :price=>5}}

  subject(:order1) {described_class.new(first_order)}
  subject(:order2) {described_class.new(second_order)}

  context "to check the what's ordered" do
    it "returns the order" do
      expect(order1.bucket).to eq( {:burger=>{:portions=>1, :price=>10}})
    end


    it "gives you a total cost of the order when ordering one dish" do
        expect(order1.total).to eq 10
    end

    it "gives you a total cost of the order when ordering multiple dishes" do
        expect(order2.total).to eq 30
    end
  end





end
