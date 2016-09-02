require 'restaraunt'


describe Restaraunt do
  context '#select_items' do

    it 'returns the correct selection items inputted' do

    end

    it 'allows the user to specify how many of each food they want'

    xit 'raises an error if selection is not in menu' do

      expect{subject.select_items}.to raise_error "item not in menu, select again"
    end
  end
end
