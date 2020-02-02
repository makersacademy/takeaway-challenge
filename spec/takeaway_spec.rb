describe Takeaway do
  describe '#initalize' do
    it 'returns a menu list object' do
      expect(subject.menu_list).to be_kind_of(Hash)
    end
  end
end
