require 'message'

describe 'Message' do
  it 'responds to send ' do
    expect(Message).to respond_to(:send)
  end

end
