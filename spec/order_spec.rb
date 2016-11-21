require "order"
#returns the order and total amount
describe Order do

  first_order = {:burger=>{:portions=>1, :price=>10}}
  second_order = {:burger=>{:portions=>2, :price=>10}, :salad=>{:portions=>2, :price=>5}}

  subject(:order1) {described_class.new(first_order)}
  subject(:order2) {described_class.new(second_order)}




  it " confirms the bucket and total" do
      expect(order1.confirm).to eq 10
  end

end
