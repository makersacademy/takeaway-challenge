require 'message'

describe 'Message' do
  #How to stub api - esp. without
  it 'responds to send ' do
    expect(Message).to respond_to(:send)
  end

end
