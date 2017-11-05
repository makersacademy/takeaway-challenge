require 'formats/menuformat'

describe MenuFormat do
  let(:menuitem) { double(:menuitem, title: 'fish', price: '£5.00') }
  let(:formatter) { described_class.new(length: 50, index_length: 6) }
  subject { formatter }

  include_examples 'formatter'

  describe '#format' do
    context 'when creating formatted string' do
      let(:index) { '   4 |' }
      subject { formatter.format(4, menuitem) }

      it 'starts with formatted index' do
        expect(subject).to start_with index
      end

      it 'follows index with title' do
        expect(subject.gsub(index, '')).to start_with ' fish '
      end

      it 'ends with price' do
        expect(subject).to end_with ' £5.00'
      end

      it 'is 50 characters' do
        expect(subject.length).to eq 50
      end
    end

    context 'when using default parameters' do
      subject { described_class.new.format(4, menuitem) }

      it 'is 40 characters' do
        expect(subject.length).to eq 40
      end

      it 'starts with formatted index' do
        expect(subject).to start_with '  4 |'
      end
    end
  end
end
