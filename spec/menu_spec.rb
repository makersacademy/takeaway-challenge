require 'menu'

describe Menu do

  let(:menu) { described_class.new }
  
  describe '#format menu' do
    it 'formats the menu' do
      expect(menu.format_menu).to include :pizza
    
    end
  end
end