require 'till'

describe Till do

  subject(:till) { Till.new double :order, items: { burger: [1, 9.99]} }

  it "calculates a total" do
    expect(till.total).to eq 9.99
  end

  xit "shows a reciept" do

  end
end
