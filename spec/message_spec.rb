require 'message'
require 'time'

describe Message do
  it 'Should have a message class' do
    expect(Message).to respond_to(:new)
  end

  it 'Should initialize with the current time + 1 hour' do
    expect(subject.time).to eq((Time.now + 1 * 60 * 60).strftime("%k:%M"))
  end

  describe '#text_confrim' do
    it 'Should have a #text_message method' do
      expect(subject).to respond_to(:text_message)
    end
  end
end
