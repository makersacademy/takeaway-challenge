require 'till'

describe Till do

  let(:order   ) { double :order, items: { :burger => 9.99 } }
  let(:notifier) { double :notifier, notify: nil }
  subject(:till) { Till.new order, notifier }

  it "calculates a total" do
    expect(till.total).to eq 9.99
  end

  it "generates a message" do
    expect(till.generate_message).to eq "Thank you for your order!"
  end

  it "sends the message to a messenger" do
    expect(notifier).to receive(:send_message).with("Thank you for your order!")
    till.notify
  end
end
