describe Menu do
  describe '#meals' do
    context 'when initialized' do
      it 'contains default menu' do
        expect(subject.meals).not_to be_empty
      end
    end
  end
end
