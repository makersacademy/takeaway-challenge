require 'takeaway'

describe Takeaway do
  #subject(:takeaway) {described_class.new}
  subject(:takeaway) {described_class.new}


  describe '#initialize' do

    xit 'initializes with an instance of menu' do
      expect(takeaway.menu).to be_truthy
    end
  end

  describe '#greeting_message' do
    xit 'returns greeting message' do
      message = "Greetings, Welcome to Ruby Sushi!"
      expect(takeaway.greeting_message).to eq message
    end
  end

  context 'total correct' do
    before do
      #allow(takeaway).to receive(:gets).and_return("done\n", "y\n")
       $stdin = StringIO.new("done")
      # test_stdin = -> { Array.new(2) { gets.chomp } }
      # $stdin = StringIO.new("done\ny\n")
      # expect(test_stdin.call).to eq ["done", "y"]
      #

    end
    it 'calls correct method with input of y' do
      expect(takeaway).to receive(:correct)
      takeaway.total_correct?
    end
  end

  context 'total incorrect' do
    before do
      allow(takeaway).to receive(:gets).and_return("done\n", "n\n")
      allow(takeaway.total_correct?).to receive(:incorrect)
    end
    xit 'calls incorrect method with input of n' do
      expect(takeaway.total_correct?).to have_received(:incorrect)
      #expect(takeaway.total_correct?).to eq false
    end
  end

end
