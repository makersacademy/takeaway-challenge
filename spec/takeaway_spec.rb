describe Takeaway do
  let(:menu) { double('Menu') }

  describe '#see_menu' do
    it 'should return menu' do
      takeaway = Takeaway.new(menu)
      expect(takeaway.see_menu).to eq(menu)
    end
  end
end