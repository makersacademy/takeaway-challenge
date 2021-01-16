require 'bill_calculator'

describe BillCalculator do

  it "adds up the bill" do
    order = ["Hello Meow", "Vanilla", "Perforated Air"]
    subject.bill(order)
    expect(subject.cost).to eq(32.73)
  end

end
