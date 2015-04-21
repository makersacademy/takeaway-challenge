require 'text_confirm'
RSpec.configure do |config|
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe TextConfirm do
  let(:text_confirm) { described_class.new }
  let(:my_order) { { cheeseburger: 2, chips: 1, coke: 1, total: 8.50 } }
  let(:time) { (Time.new + 3600) }
  let(:formated_order) { my_order.to_s + " expect delivery at #{time.strftime('%H:%M')}" } # rubocop: disable all
  let(:fake_client) { double(:fake_client) }

  it 'can format a given order' do
    expect(text_confirm.format_order(my_order)).to eq formated_order
  end

  it 'raises an error if theres no order to send' do
    expect { text_confirm.send_order }.to raise_error 'no order'
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