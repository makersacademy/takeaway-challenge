require 'sms'

describe SMS do
  let(:time) do
    double("Time")
  end

  it 'should return the right message' do
    allow(time).to receive(:strftime).and_return("17:52")
    expect(subject.confirmation_message(time)).to eq("Thank you! Your order was placed at 17:52 and will be delivered in half an hour.")
  end
end
