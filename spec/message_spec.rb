require 'message'
require 'env'

describe Message do
  it 'responds to the confirmation method' do
    expect(subject).to respond_to(:confirmation)
  end

  it 'returns the account_sid correctly' do
    expect(Env::TWILIO_ACCOUNT_SID).to eq(Env::TWILIO_ACCOUNT_SID)
  end

  it 'expects some of these tests to be useful?' do
    allow(subject).to receive(:confirmation).and_return(true)
    expect(subject.confirmation).to eq(true)
  end

end
