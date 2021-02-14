describe Display do
  describe '#view_menu' do
    it 'shows the menu in nice format' do
      expect(subject.view_menu(Menu::PIZZA)).to include("Marinara: £8.00")
    end
  end

  describe '#view_order' do
    let(:order) { [{ bufalina: 13 }, { diavola: 14 }] }

    it 'displays the order in nice format' do
      expect(subject.view_order(order)).to include("Diavola: £14.00")
    end

    it 'displays the total in nice format' do
      expect(subject.view_order(order)).to include("Total: £27.00")
    end
  end

  describe '#confirm_added' do
    it 'confirms meal was added to order' do
      confirm_add = described_class::MEAL_ADD_CONFIRMATION
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
      let(:confirmation) do
        [described_class::CONFIRMATION_PROMPT,
         described_class::ORDER_CONFIRMATION].join("\n") + "\n"
      end

      it 'confirms the order' do
        allow(STDOUT).to receive(:puts) { nil }
        allow(subject).to receive(:gets) { "\n" }
        expect { subject.confirm_order }.to output(confirmation).to_stdout
      end
    end
  end

  describe '#invalid_meal' do
    it 'tells customer choice is invalid' do
      invalid = "chips#{described_class::INVALID_MEAL_MESSAGE}"
      expect(subject.invalid('chips')).to eq invalid
    end
  end
end
