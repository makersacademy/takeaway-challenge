require 'messenger'

describe Messenger do
  it 'responds to #set_message' do
    expect(subject).to respond_to :set_message
  end

  it 'responds to #send_message' do
    expect(subject).to respond_to :send_message
  end

end
