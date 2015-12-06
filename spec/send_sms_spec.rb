
require 'send_sms'

describe Send_SMS do
  subject(:sms) {described_class.new}
  let(:customer) {{phone: :"+447723929855", name: :William}}

  xit 'sends text messages with 45 minutes ahead stamp' do
    expect(sms.confirmation_text(customer)).to eq(customer)
  end
end
