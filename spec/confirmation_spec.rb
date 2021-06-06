require 'confirmation'

describe Confirmation do
  subject(:confirmation) { described_class.new }
  let(:payment) { :payment }

  it 'raises an error if the money does not match the total' do
    expect { subject.checkout(payment) }.to raise_error(RuntimeError,'something went wrong, try again')
  end

  before do
    allow(confirmation).to receive(:send_text)
  end

  it "displays time in hour, minutes, am/pm, one hour from current time" do
    expect(confirmation.time).not_to eq(Time.now)
  end

  it "sends a text that food will be delivered within an hour" do
    confirmation.time
  end
end

