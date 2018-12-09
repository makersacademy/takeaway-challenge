require "summary"

describe Summary do

  it "should return a string with the items irdered and the total to pay" do
    order = [{ Pizza: 8 }]
    sum = Summary.new(order)
    expect(sum.run).to eq("You've ordered [{:Pizza=>8}] and it cost £8")
  end
end
