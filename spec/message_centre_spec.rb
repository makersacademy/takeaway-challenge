require 'message_centre'

describe MessageDespatch do
  let(:texter) { double :texter }
  subject(:message_despatch) { MessageDespatch.new texter}

  it 'allows user to set an automatic message' do
    message_despatch.message = "Many thanks!"
    expect(message_despatch.generate_message).to eq "Many thanks! Your order will be with you by #{message_despatch.time_in_one_hour}."
  end

  it "time-stamps a pre-set message" do
    expect(message_despatch.generate_message).to eq "Thank you for your order! Your order will be with you by #{message_despatch.time_in_one_hour}."
  end

  it "sends the message to a messenger" do
    expect(texter).to receive(:send_message)
    message_despatch.process 447785244600
  end

end
