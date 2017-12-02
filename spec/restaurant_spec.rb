require 'restaurant.rb'
describe Restaurant do

  context 'menu' do

    it 'should be an array' do
      expect(Restaurant.new.menu).to be_an_instance_of(Array)
    end

  
  end

end
