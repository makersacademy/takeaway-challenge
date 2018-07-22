# "test" is used as the test instance, for easy understanding
require 'menu'

describe Menu do
  subject(:test_menu) { described_class.new(food) }

  let(:food) do
    { 
      thing1: 3.00,
      thing2: 5.00
    }
  end
  
  context 'display menu' do # user can see menu

    # it 'has an array of hashes (menu items with prices)' do
    #   expect(subject).to respond_to(:food) # Menu class reads :food attribute
    #   expect(subject.food).to be_a(Array) # :food is a hash     
    # end
    it 'has a list of items with prices' do
      expect(subject.food).to eq(food)
    end

    it 'shows the menu items with prices' do
      displayed_menu = "Thing1 £3.00, Thing2 £5.00"
      expect(subject.show).to eq(displayed_menu)
    end
  end
end
