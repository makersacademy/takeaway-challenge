describe Display do
  let(:order) { [{ bufalina: 13 }, { diavola: 14 }] }
  let(:menu) { Menu::PIZZA }

  describe '#view_menu' do
    it 'shows the menu in nice format' do
      expect(subject.view_menu(menu)).to include("Marinara: £8.00")
    end
  end

  describe '#total' do
    it 'returns the order total' do
      expect(subject.total(order)).to be 27
    end
  end

  describe '#format' do
    it 'formats 1 to £1.00' do
      expect(subject.format(1)).to eq '£1.00'
    end

    it 'formats 13 to £13.00' do
      expect(subject.format(13)).to eq '£13.00'
    end

    it 'formats 0.5 to £0.50' do
      expect(subject.format(0.5)).to eq '£0.50'
    end
  end

  describe '#view_order' do
    it 'displays the order in nice format' do
      expect(subject.view_order(order)).to include("Diavola: £14.00")
    end

    it 'displays the total in nice format' do
      expect(subject.view_order(order)).to include("Total: £27.00")
    end
  end
end
