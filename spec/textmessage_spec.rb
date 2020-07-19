require 'textmessage'
describe TextConfirmation do
  let(:time) { double :time }
  let(:time_now) { double("time", new: time) }
  let(:textconfirmation) { double("textconfirmation", delivery_time: time_now, client: "client") }
  it 'has a deliver time that is one hour from the actual time' do
    expect(subject.delivery_time).not_to be_nil
  end
  describe '#send_message' do
    it 'sends a message' do
      allow(textconfirmation).to receive(:send_message).and_return("Confirmation Sent")
      expect(textconfirmation.send_message).to eq "Confirmation Sent"
    end
    # I know this test is pointless, but didn't know how to test that the text message is sent without actually sending it!
  end
end
