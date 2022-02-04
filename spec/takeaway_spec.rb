require 'takeaway'

describe Takeaway do
  describe '#menu' do
  dishes = [{pizza: '£9'}, {pasta: '£7'}]
    it 'shows a list of all the dishes and their prices' do 
      takeaway = Takeaway.new(dishes)
      expect(takeaway.menu).to eq dishes

    end
  end
end