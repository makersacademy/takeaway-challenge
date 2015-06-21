require 'till'

describe Till do

  subject(:till) { Till.new double :order, items: { :burger => 9.99 } }

  it "calculates a total" do
    expect(till.total).to eq 9.99
  end

  xit "generates a receipt" do
    expect(receipt).to recieve(:print)
    till.print_receipt
  end

  xit "sends a text" do
    expect(notifier).to receive(:text)
    till.notify
  end
end
