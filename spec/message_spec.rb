require 'message'

describe Message do
  let(:messenger) { Message.new }

  describe 'Initialization' do
    it { is_expected.to be_a Message }
  end

  it 'has an account SID' do
    expect(messenger.account_sid).to eq "ACa37fb9dee53bb1f468ecddfcdd0556ac"
  end

  it 'has an auth token' do
    expect(messenger.auth_token).to eq "5a9ab3d2e1d7983e2b673a2d4bec04a6"
  end
end
