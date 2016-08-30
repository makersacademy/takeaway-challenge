require 'selection'

describe Selection do

  context '#select_items' do

    xit 'returns the correct selection items inputted' do
      allow(subject).to receive(:gets).and_return('jam', 3, 'quit')
      expect{subject.select_items}.to eq [{food: 'jam', quantity: 3}]

    end

    it "should echo" do
      pending 'a failing test so close!'
      allow(STDIN).to receive(:gets).and_return('jam', '3', 'quit')
      expect(subject.select_items).to eq [{food: 'jam', quantity: 3}]
    end


    it 'allows the user to specify how many of each food they want'

    xit 'returns empty selection order' do
      allow(STDIN).to receive(:gets).and_return('quit')
      expect(subject.select_items).to eq []
    end

    xit 'raises an error if selection is not in menu' do
      pending 'infinite loop'
      allow(STDIN).to receive(:gets) { 'pebbles' }
      expect{subject.select_items}.to raise_error "item not in menu, select again"
    end
  end
end
