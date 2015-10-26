require 'text'

describe Text do

  subject(:text) { described_class.new }

  it 'send a text' do
   expect(text).to respond_to(:send_text)
 end
end
