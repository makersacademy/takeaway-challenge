require 'menulist'

describe MenuList do
  let(:menulist) { described_class.new }

  context '#show_list' do
    it 'should return an array value' do
      expect(menulist.get_menu).to be_an_instance_of(Array)
    end
  end
end
