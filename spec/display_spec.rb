describe Display do
  let(:order) { [{ bufalina: 13 }, { diavola: 14 }] }
  let(:confirm_add) { 'Marinara has been added to your order 🍕' }
  let(:menu) { Menu::PIZZA }

  describe '#view_menu' do
    it 'shows the menu in nice format' do
      expect(subject.view_menu(menu)).to include("Marinara: £8.00")
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

  describe '#confirm_added' do
    it 'confirms meal was added to order' do
      expect(subject.confirm_added('marinara')).to eq confirm_add
    end
  end
end
