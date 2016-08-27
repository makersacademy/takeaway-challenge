require 'selection'

describe Selection do

  context '#select_items' do

    it 'returns the correct selection items inputted'

    it 'allows the user to specify how many of each food they want'

    xit 'returns empty selection order' do
      pending 'infinite loop'
      allow(STDIN).to receive(:gets) {'quit'}
      expect(subject.select_items).to eq []
    end

    xit 'raises an error if selection is not in menu' do
      pending 'infinite loop'
      allow(STDIN).to receive(:gets) { 'pebbles' }
      expect{subject.select_items}.to raise_error "item not in menu, select again"
    end
  end
end
