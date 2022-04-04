require_relative '../lib/takeaway'
require_relative '../lib/menu'

describe Takeaway do
  context '#initialize' do
    it 'accepts an instance of menu class when it is created' do
      indian = Menu.new
      langley = Takeaway.new(indian)
      expect(langley.menu_class).to be_an_instance_of Menu 
    end
  end
end
