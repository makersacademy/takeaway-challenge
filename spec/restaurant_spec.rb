describe Restaurant do
  let(:menu) { instance_double(Menu, :menu, meals: Menu::PIZZERIA) }
  subject { described_class.new(menu) }

  describe '#see_menu' do
    it 'displays the meals and prices' do
      expect(subject.see_menu).to be menu.meals
    end
  end
end
