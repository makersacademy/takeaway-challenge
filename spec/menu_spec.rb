require 'menu'

describe Menu do
  subject(:menu) {described_class.new}

  describe '#initialize' do

    it 'opens menu on the default cuisine choice of ItalianFood' do
      expect(menu.cuisine_choice).to eq ItalianFood
    end

    it 'opens menu with a selection array' do
      expect(menu.selection).to be_a Array
    end 

    it 'opens menu with an empty selection array as default' do
      expect(menu.selection).to be_empty
    end
  end


end
