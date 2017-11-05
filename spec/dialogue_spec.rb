#!/usr/bin/env ruby

require 'dialogue'

describe Dialogue do

  let(:order) { double(:order, total: 'price', format: 'some dishes') }
  let(:string) { double(:string, :% => 'output') }
  let(:dialogue) { described_class.new }
  let(:time) { double(:time, strftime: 'time') }
    
  before(:each) do
    dialogue.methods.grep(/.*_msg/).each do |name|
      allow(dialogue).to receive(name).and_return(string)
    end
  end

  shared_examples 'returns value' do |message|
    it 'returns formatted message' do
      expect(subject.send(message, *args)).to eq 'output'
    end
  end

  subject { dialogue }

  describe '#confirmed' do
    context 'when given delivery time' do
      after(:each) { dialogue.confirmed(time) }

      it 'returns confirmation containing time' do
        expect(time).to receive(:strftime).with('%H:%M:%S')
      end

      it 'interpolates into confirmed message' do
        expect(string).to receive(:%).with('time')
      end
    end

    context 'when returning value' do
      let(:args) { [time] }
      include_examples 'returns value', :confirmed
    end
  end

  describe '#malformed_message' do
    context 'when given errors' do
      after(:each) { dialogue.malformed('errors') }

      it 'interpolates into confirmed message' do
        expect(string).to receive(:%).with('errors')
      end
    end

    context 'when returning value' do
      let(:args) { ['some error'] }
      include_examples 'returns value', :malformed
    end
  end

  describe '#duplication' do
    context 'when given duplicated' do
      let(:array) { ["100", "200"] }
      after(:each) { dialogue.duplicated(array) }

      it 'converts array to string without brackets' do
        expect(array).to receive(:join).with(', ')
      end

      it 'interpolates into confirmed message' do
        expect(string).to receive(:%).with('100, 200')
      end
    end

    context 'when returning value' do
      let(:args) { [[1, 2]] }
      include_examples 'returns value', :duplicated
    end
  end

  describe '#unknown_items' do
    context 'when given unknown items' do
      let(:array) { ["100", "200"] }
      after(:each) { dialogue.unknown(array) }

      it 'converts array to string without brackets' do
        expect(array).to receive(:join).with(', ')
      end

      it 'interpolates into confirmed message' do
        expect(string).to receive(:%).with('100, 200')
      end
    end

    context 'when returning value' do
      let(:args) { [[1, 2]] }
      include_examples 'returns value', :unknown
    end
  end

  describe '#confirm?' do
    context 'when given order' do
      after(:each) { dialogue.confirm?(order) }

      it 'converts order to formatted string' do
        expect(order).to receive(:format)
      end

      it 'converts order to price' do
        expect(order).to receive(:total)
      end

      it 'interpolates into confirmed message' do
        expect(string).to receive(:%).with(['some dishes', 'price'])
      end
    end

    context 'when confirming' do
      let(:args) { [order] }
      include_examples 'returns value', :confirm?
    end
  end
end
