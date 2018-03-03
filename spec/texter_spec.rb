require 'texter'

describe Texter do

  subject(:texter) { described_class.new }

  it 'sends a text' do
    number = '+447951596154'
    body = "This is a text"
    texter.send(number, body)
    expect(texter.messages[0].body).to include body
  end

end
