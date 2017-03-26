require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  describe '#initialize' do
    it 'initializes with an instance of menu' do
      expect(takeaway.menu).to be_truthy
    end
  end

  describe '#greeting_message' do
    it 'returns greeting message' do
      message = "Greetings, Welcome to Ruby Sushi!"
      expect(takeaway.greeting_message).to eq message
    end
  end

  context 'total correct' do
    before do
      allow(takeaway).to receive(:gets).and_return("done\n", "y\n")
    end

    it 'calls correct method with input of y' do
      expect(takeaway.total_correct?).to be_truthy
    end


  end

  context 'total incorrect' do
    before do
      allow(takeaway).to receive(:gets).and_return("done\n", "n\n")
      allow(takeaway.total_correct?).to receive(:incorrect)
    end
    it 'calls incorrect method with input of n' do
      expect(takeaway.total_correct?).to have_received(:incorrect)
      #expect(takeaway.total_correct?).to eq false
    end
  end

end
