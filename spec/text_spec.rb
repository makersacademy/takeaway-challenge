require 'text'

describe Text do
  it 'exists' do
    expect(subject).to be_instance_of Text
  end
  describe '#send_text' do
    it 'takes one argument' do
      expect(subject).to respond_to(:send_text).with(1).argument
    end
  end
end
