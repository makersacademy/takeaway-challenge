require 'formats/itemisedformat'

describe ItemisedFormat do
  let(:menuitem) { double(:menuitem, title: 'fish') }
  let(:formatter) { described_class.new(length: 50, count_length: 4) }
  subject { formatter }
  include_examples 'formatter'


  describe '#format' do
    context 'when creating formatted string' do
      let(:count) { 'x4  ' }
      subject { formatter.format(menuitem, 4) }

      it 'starts with title' do
        expect(subject).to start_with 'fish '
      end

      it 'ends with formatted count' do
        expect(subject).to end_with count
      end

      it 'is 50 characters' do
        expect(subject.length).to eq 50
      end
    end

    context 'when using default parameters' do
      subject { described_class.new.format(menuitem, 4) }

      it 'is 20 characters' do
        expect(subject.length).to eq 20
      end

      it 'starts with formatted index' do
        expect(subject).to end_with 'x4 '
      end
    end
  end
end
