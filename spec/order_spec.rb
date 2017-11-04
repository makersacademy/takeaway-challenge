require 'order'

describe Order do
  context 'When asking for the menu' do
    it 'prints the menu on the ouput' do
      expect { subject.asks_menu }.to output.to_stdout
    end
  end

  context 'asking for a dish' do
    it 'returns the specified dish' do
      expect(subject.asks_for_dish('pancake')).to eq ({:Pancake=>1.0})
    end
  end
end
