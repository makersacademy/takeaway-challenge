require "order"

describe Order do

  it "returns total cost of order " do 
    subject.total = 5
    expect(subject.confirm).to eq "Order complete, your total is £5"
  end

  it "has an empty selection at the start" do 
    expect(subject.selection).to be_empty
  end

  it "checks total not selection for cost " do
    subject.selection = {:pasta => 6}
    expect(subject.confirm).to eq ("Order complete, your total is £0")
  end

end