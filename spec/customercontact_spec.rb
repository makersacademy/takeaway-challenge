require 'customercontact'

describe CustomerContact do

  subject { CustomerContact.new(client) }
  let(:client)    { double :client, messages: messages}
  let(:messages)  { double :messages }

  describe '#send_message' do

    it "sends a text with total and a delivery time" do
      details = {from: 1,
      to: 2,
      body: "Thank you for your order - your total is £10. Your food will be delivered by 19:00."}
      allow(subject).to receive(:order_time).and_return("19:00")
      expect(messages).to receive(:create).with(details)
      subject.send_message(10, details)
    end

  end

  # describe '#order_time' do
  #
  #   it "returns one hour from current time" do
  #     allow(Time).to receive(:now).and_return(Time.parse('13:30'))
  #     expect(subject.order_time).to eq("14:30")
  #   end
  #
  # end

end
