require 'interface'

describe Interface do
  subject(:interface) {described_class.new}

  describe '#initialize' do
    it 'initializes with an instance of menu' do
      expect(interface.menu).to be_truthy
    end
  end

  describe '#greeting_message' do
    it 'returns greeting message' do
      message = "Greetings, Welcome to Ruby Sushi!"
      expect(interface.greeting_message).to eq message
    end
  end

end
