require 'payment'

describe 'Payment' do
  subject = Payment.new

  before do
    IO.any_instance.stub(:puts)
    $stdin = StringIO.new("30\n")
    subject.receive_payment
  end

  it 'receives payment of £30' do
    expect(subject.received_total).to eq 30
  end

  it 'raises an error if total and bill do not match' do
    expect{ subject.check_bill(15) }.to raise_error("Incorrect amount entered: Please try again")
  end

end
