require 'messenger'

describe Messenger do
  it 'has send_confirmation method' do
    expect(subject).to respond_to(:send_confirmation)
  end
end
