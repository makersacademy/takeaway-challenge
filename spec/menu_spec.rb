require 'menu'

describe Menu do
  describe '#load_menu' do
    it 'should load menu from csv file into @menu' do
      expect(@menu).not_to be_empty
    end
  end
end
