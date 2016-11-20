require "order"
#returns the order and total amount
describe Order do

  first_order = {:burger=>{:portions=>1, :price=>10}}
  second_order = {:burger=>{:portions=>2, :price=>10}}

  subject(:order1) {described_class.new(first_order)}
  subject(:order2) {described_class.new(second_order)}

  context "to check the what's ordered" do
    it "returns the order" do
      expect(order1.bucket).to eq( {:burger=>{:portions=>1, :price=>10}})
    end

  end





end
