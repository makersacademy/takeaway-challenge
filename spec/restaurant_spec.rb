describe Restaurant do
  describe '#see_menu' do
    it 'shows the dishes and prices' do
      expect(subject.see_menu) eq example_menu
    end
  end
end
