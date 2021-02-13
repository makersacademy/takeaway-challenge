describe Display do
  let(:order) { [{bufalina: 13}, {diavola: 14}] }
  let(:menu) { Menu::PIZZA }
  let(:menu_output) do [
    "Marinara: 8",
    "Margherita: 10",
    "Bufalina: 13",
    "Diavola: 14",
    "Napoli: 14",
    "Calzone: 14",
    "Fiorentina: 14",
    "Capricciosa: 15"
    ]
  end

  describe '#view' do
    it 'shows the menu in nice format' do
      expect(subject.view(menu)).to eq menu_output
    end
  end

  describe '#total' do
    it 'returns the order total' do
      expect(subject.total(order)).to be 27
    end
  end
end
