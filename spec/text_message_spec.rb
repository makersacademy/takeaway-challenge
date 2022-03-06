require 'text_message'

describe TextMessage do
  subject(:text) { described_class.new }

  it 'can create a TextMessage' do
    expect(text).to be_a_kind_of(TextMessage)
  end
end
