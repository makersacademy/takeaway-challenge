require 'Text'

# test api requests here

describe Text do
  context 'when initialising' do
    it 'creates an instace of Text' do
      text = Text.new
      expect(text).to be_an_instance_of(Text)
    end
  end

  describe '#send_text' do
    # it 'takes a phone number as arg as send a confirmation text to that number' do

    # end
  end
end
