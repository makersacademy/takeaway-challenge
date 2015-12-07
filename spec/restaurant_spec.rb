
require 'restaurant'
describe 'Restaurant' do

   subject(:restaurant) { described_class.new }


   it "there is a menu" do
      expect(Restaurant::MENU).to_not be_empty
    end

end
