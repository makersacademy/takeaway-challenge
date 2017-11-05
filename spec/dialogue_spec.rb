require 'dialogue'

# All formatted strings return the same thing
class String
  def %(*args)
    'output'
  end
end

describe Dialogue do
  let(:order) { double(:order, total: 'price', format: 'dishes', time: '1') }
  let(:dialogue) { described_class.new }

  shared_examples 'interpolates once' do |message|
    let(:arg) { 'input' }

    context 'when building message' do 
      after(:each) { dialogue.send(message, arg) }

      it 'returns formatted message' do
        expect(dialogue.send(message, arg)).to eq 'output'
      end
    end
  end

  describe '#malformed' do
    include_examples 'interpolates once', :malformed, 'input'
  end

  describe '#duplicated' do
    include_examples 'interpolates once', :duplicated, 'input'
  end

  describe '#missing' do
    include_examples 'interpolates once', :missing, 'input'
  end

  describe '#confirmed' do
    include_examples 'interpolates once', :confirmed, 'input'
  end

  describe '#finalise' do
    context 'when building message' do 
      let(:object) { double(:object, total: '', format: '') }
      after(:each) { dialogue.finalise(object) }

      it 'returns formatted message' do
        expect(dialogue.finalise(object)).to eq 'output'
      end
    end
  end

  describe '#no_order' do
    it 'returns string' do
      expect(subject.no_order).to be_a String
    end
  end

  describe '#in_progress' do
    it 'returns string' do
      expect(subject.in_progress).to be_a String
    end
  end

  describe '#cancel' do
    it 'returns string' do
      expect(subject.in_progress).to be_a String
    end
  end
end
