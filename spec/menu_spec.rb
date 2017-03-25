require 'menu'
describe Menu do
# This class contains all of the available dishes

  describe '#dishes' do
    it 'contains items initially' do
      expect(subject.dishes).not_to be_empty
    end
  end

end
