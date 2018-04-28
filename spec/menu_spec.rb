require 'menu'

describe Menu do

  let(:menu) { Menu.new }

  describe '#display' do
    it 'displays a menu' do
      expect{ menu.display }.to output.to_stdout
    end
  end

end
