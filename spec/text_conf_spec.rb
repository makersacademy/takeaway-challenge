require 'text_conf'
RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe TextConfirm do
  let(:text_confirm) { TextConfirm.new }
  let(:my_order) { { bigmac: 3, fries: 1, milk_shake: 2, total: 14.94} }
  let(:time) { (Time.new + 3600) }
  let(:formated_order) { my_order.to_s + " expect delivery at #{time.strftime("%H:%M")}" }
  let(:fake_client) {double (:fake_client)}

  it 'can format a given order' do
    expect(text_confirm.format_order(my_order)).to eq formated_order
  end

  it 'raises an error if theres no order to send' do
    expect{text_confirm.send_order}.to raise_error 'no order'
  end

  before(:example) do
    fake_client.stub_chain("account.messages.create") { |arg| arg[:body] }
    Twilio::REST::Client.stub(:new).and_return(fake_client)
  end

  it 'can send an order via text' do
    text_confirm.format_order(my_order)
    expect(text_confirm.send_order).to eq formated_order
  end

end
