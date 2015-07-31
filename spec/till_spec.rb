require 'till'

describe Till do

  let(:order         ) { double :order, items: { :burger => 9.99 } }
  let(:notifier      ) { double :notifier, notify: nil }
  let(:message_centre) { double :message_centre, process: nil }

  subject(:till)       { Till.new order }

  it "calculates a total" do
    expect(till.total).to eq 9.99
  end

  it 'sends the total to receipt when order is finalised' do
    expect(message_centre).to receive(:process)
    till.process message_centre, 447785244600
  end

  xit "generates a receipt" do

  end

end
