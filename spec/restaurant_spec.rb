describe Restaurant do
  let(:order) { [{ napoli: 13 }, { diavola: 14 }] }
  let(:order_output) { ['napoli: £13.00', 'Diavola: £14.00', 'Total: £27.00'] }
  let(:menu) { instance_double(Menu, :menu, meals: Menu::PIZZA) }

  let(:menu_output) do [
    'Marinara: £8.00',
    'Margherita: £10.00',
    'Bufalina: £13.00',
    'Diavola: £14.00',
    'Napoli: £14.00',
    'Calzone: £14.00',
    'Fiorentina: £14.00',
    'Capricciosa: £15.00'
  ]
  end

  let(:customer_service) do instance_double(
    CustomerService, :customer_service,
    confirmation_text: 'text sent'
    )
  end

  let(:display) do instance_double(
    Display, :display,
    view_menu: menu_output,
    view_order: order_output,
    confirm_order: nil,
    confirm_added: nil
    )
  end

  subject do described_class.new(
    menu: menu,
    display: display,
    customer_service: customer_service
    )
  end

  describe '#view_menu' do
    it 'displays the meals and prices in nice format' do
      expect(subject.view_menu).to eq menu_output
    end
  end

  describe '#add' do
    it 'adds meal to order' do
      subject.add(:marinara)
      expect(subject.send(:order)).to include Menu::PIZZA.slice(:marinara)
    end
  end

  describe '#place_order' do
    it 'asks for user input to confirm order' do
      allow(STDOUT).to receive(:puts) { nil }
      allow(subject).to receive(:gets) { "\n" }
      expect(STDOUT).to receive(:puts)
      subject.place_order
    end
  end

  describe 'view_order' do
    it 'shows the order and total in nice format' do
      allow(subject).to receive(:order) { order }
      expect(subject.view_order).to eq order_output
    end
  end

  describe '#customer_service' do
    it 'receives method call to send confirmation text' do
      allow(STDOUT).to receive(:puts) { nil }
      expect(customer_service).to receive(:confirmation_text)
      subject.place_order
    end
  end
end
