describe Order do
  describe '#see_menu' do
    it 'returns an array of dishes' do
      expect(subject.see_menu).to be_instance_of(Array)
    end
  end
end