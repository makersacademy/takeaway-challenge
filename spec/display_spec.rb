describe Display do
  let(:order) { [{ bufalina: 13 }, { diavola: 14 }] }
  let(:confirm_add) { described_class::MEAL_ADD_CONFIRMATION }
  let(:menu) { Menu::PIZZA }
  let(:confirmation) do [
    described_class::CONFIRMATION_PROMPT,
    "#{described_class::ORDER_CONFIRMATION}\n",
  ].join("\n")
  end

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
      expect(subject.confirm_added('marinara')).to eq "Marinara#{confirm_add}"
    end
  end

  describe '#confirm_order' do
    it 'confirms the order' do
      allow(subject).to receive(:gets) { "\n"}
      allow(STDOUT).to receive(:puts) { nil }
      expect {
        subject.confirm_order
      }.to output(confirmation).to_stdout
    end
  end
end
