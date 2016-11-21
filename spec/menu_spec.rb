require './lib/menu'

describe Menu do

  let(:menu)  { described_class.new }
  let(:quantity) { double(:quantity) }

  context 'Initialization' do

    it 'initializes with a list of food' do
      expect(menu.menu_list).not_to be_empty
    end

  end

end
