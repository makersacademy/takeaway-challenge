require 'text'

describe Text do
  let(:klass) { Class.new { extend Text } }

  before do
    expect(klass).to receive(:send_text)
  end

#   it 'sends a message to customer' do
#     expect(klass.send_text('message')).to eq 'message'
#   end
end
