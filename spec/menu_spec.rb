describe Menu do
  describe '#meals' do
    context 'when initialized without arguments' do
      it 'contains default pizza menu' do
        expect(subject.meals).to be described_class::PIZZA
      end
    end

    context 'when intialized with argument' do
      let(:thai) { { pad_thai: 12 } }
      subject { described_class.new(thai) }

      it 'overrides default menu' do
        expect(subject.meals).to be thai
      end
    end
  end
end
