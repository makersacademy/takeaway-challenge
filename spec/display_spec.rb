describe Display do
  let(:confirm_add) { described_class::MEAL_ADD_CONFIRMATION }
  let(:order) { [{ bufalina: 13 }, { diavola: 14 }] }
  let(:menu) { Menu::PIZZA }

  let(:confirmation) do
    [described_class::CONFIRMATION_PROMPT,
     described_class::ORDER_CONFIRMATION].join("\n") + "\n"
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
    context 'when customer cancels' do
      it 'throws error' do
        allow(STDOUT).to receive(:puts) { nil }
        allow(subject).to receive(:gets) { 'c' }
        expect { subject.confirm_order }.to raise_error RuntimeError
      end
    end

    context 'when customer confirms' do
      it 'confirms the order' do
        allow(STDOUT).to receive(:puts) { nil }
        allow(subject).to receive(:gets) { "\n" }
        expect { subject.confirm_order }.to output(confirmation).to_stdout
      end
    end
  end

  describe '#invalid_meal' do
    it 'tells customer choice is invalid' do
      expect(subject.invalid('chips')).to eq "chips#{described_class::INVALID_MEAL}"
    end
  end
end
