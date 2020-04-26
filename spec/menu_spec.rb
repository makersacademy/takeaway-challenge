require 'menu'

describe Menu do
  describe '#view_menu' do
    it 'Allows user to see menu items' do
      expect{ subject.view_menu }.to output(String).to_stdout
    end
  end
end
