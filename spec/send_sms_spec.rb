require 'send_sms.rb'

describe Twillio do
  subject(:twil)  { described_class.new }
  let(:order) { double(:order)}

  # before do
  #   allow(twil).to receive(:confirmation_text)
  # end

  it 'allow customers to place order by passing current dishes/quantities and expected total' do
    expect(subject).to respond_to(:confirmation_text).with(1).argument
  end
end
