require 'messenger'

describe Messenger do
  let(:messenger) { described_class.new }

  it 'is initialized with a client' do
    expect(messenger.client).to_not be_nil
  end

  it 'is initialized with a "from" number' do
    expect(messenger.from).to_not be_nil
  end
end
