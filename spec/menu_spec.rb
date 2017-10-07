require './lib/menu.rb'

describe Menu do

  subject(:menu1) { described_class.new(dishes: []) }

  describe 'initialization' do
    it 'creates a Menu with a empty dishes array' do
      expect(subject).to be_an_instance_of Menu
    end

    # it 'should initialize with an empty dishes array' do
    #
    # end

    it { is_expected.to respond_to(:dishes) }

  end

end
