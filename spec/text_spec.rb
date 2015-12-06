require 'text'


describe Text do
  subject(:text) {described_class.new}
  let(:takeaway) {double(:takeaway)}

  it {is_expected.to respond_to(:message)}

  it 'sends a text message to confirm a succesful order' do
    text.send
    expect(text.message).not_to eq nil
  end
end
