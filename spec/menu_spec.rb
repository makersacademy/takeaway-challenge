require 'menu'

describe Menu do
  subject(:menu) {Menu.new}
  describe '#list' do
    it 'creates a list with 7 items' do
      expect(subject.list.length).to eq 7
    end
  end
  describe '#print' do
    it 'prints the list' do
      expect(subject.print).to eq ([
        "Szechuan sauce: 25",
        "Pickle Rick: 5",
        "Concentrated dark matter: 45",
        "Mega seeds: 10",
        "Wamen noodles: 16",
        "Memes (Careful: extra spicy): 50",
        "Bitconnect sponsored nuggets: 20"
        ])
    end
  end

end
