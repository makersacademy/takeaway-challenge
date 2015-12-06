require 'text'


describe Text do
  subject(:text) {described_class.new}

  it {is_expected.to respond_to(:send)}

  # it 'sends a text message to confirm a succesful order' do
  #   text.send("+15005550006")
  #   expect(text.message).not_to eq nil
  # end
end
