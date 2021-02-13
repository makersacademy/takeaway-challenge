describe Restaurant do
  let(:menu) { instance_double(Menu, :menu, meals: Menu::PIZZA) }
  subject { described_class.new(menu) }

  describe '#view_menu' do
    it 'displays the meals and prices' do
      expect(subject.view_menu).to be menu.meals
    end
  end

  describe '#add' do
    it 'adds meal to order' do
      subject.add(:marinara)
      expect(subject.view_order).to include Menu::PIZZA.slice(:marinara)
    end
  end

  describe '#place_order' do
    it 'asks for user input to confirm order' do
      expect(subject).to receive(:gets)
      subject.place_order
    end
  end
end
