require "total_checker"

describe TotalChecker do

  it "returns true if the figure provided is equal to total" do
    t = TotalChecker.new(17.60)
    expect(t.check).to eq(true)
  end

  it "raises an error if the figure provided is not equal to total" do
    t = TotalChecker.new(5.00)
    expect{ t.check }.to raise_error("Please check total again.")
  end

end
