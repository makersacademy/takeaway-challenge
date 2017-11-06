require 'restaurant'

# restaurant spec file for restaurant class
describe Restaurant do
  let(:menu) { double(:menu) }
  let(:mock_menu_class) { double(:mock_menu_class, new: menu) }
  subject(:restaurant) { described_class.new(mock_menu_class) }

  describe '#initialize' do
    it 'should be an instance of Restaurant class' do
      expect(subject).to be_an_instance_of(Restaurant)
    end

  end
end
