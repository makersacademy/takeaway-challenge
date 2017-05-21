
require_relative '../lib/messenger'

describe Messenger do

  it 'responds to the #send_confirmation method' do
    expect(subject).to respond_to(:send_confirmation)
  end

end
