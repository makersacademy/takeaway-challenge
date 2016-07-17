require 'sms'

describe SMS do
  subject(:sms) { described_class.new }

  before do
    allow(Time).to receive(:now).and_return(Time.parse("17:52"))
  end

  it "should calculate the delivery time" do
    expect(subject.delivery_time).to eq "18:52"
  end

  it 'sends an SMS message' do
    expect(subject).to respond_to(:delivery_message)
  end

end
