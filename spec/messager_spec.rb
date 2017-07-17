require 'messager'

describe Messager do
  subject(:messager) { described_class.new }

  it 'should send a text with a message' do
    expect(messager).to respond_to(:send_text)
  end
end
