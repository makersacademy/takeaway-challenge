require 'order'

describe Order do
  context 'When asking for the menu' do
    it 'prints the menu on the ouput' do
      expect { subject.asks_menu }.to output.to_stdout
    end
  end
end
