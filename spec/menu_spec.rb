describe Menu do
  describe '#view' do
    it 'returns the menu' do
      allow(subject).to receive(:view).and_return(@menu = {"test item" => 1})
      expect(subject.view).to eq(@menu)
    end
  end
end