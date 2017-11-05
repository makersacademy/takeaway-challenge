require 'menu'

describe Menu do
subject(:menu) { described_class.new }



  describe 'initialize' do
    it 'gets the list of dishes and prices' do
      expect(subject.get_menu).to eq(menu_list)
    end




#it 'returns the ' do
  #expect(subject.get_menu).to


  end



end




















end
