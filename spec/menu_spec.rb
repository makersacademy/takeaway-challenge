describe Menu do
  subject(:menu) { Menu.new }

  describe '#display_available_dishes' do
    it 'should only return available dishes' do
      expect(menu.available_dishes).to include(hash_including(:name, :price, available: true)) 
    end

    context 'when unavailable dishes have been removed' do
      let(:available_dishes) { [
        { name: 'pizza', price: 9.50 },
        { name: 'pasta', price: 8.20 },
      ] }

      it 'should return available dish names and prices' do
        expect(menu.display_available_dishes).to contain_exactly(
          ['pizza', 9.50],
          ['pasta', 8.20]
        )
      end
    end
  end
end