require 'takeaway'

describe 'Feature Tests' do
  let(:takeaway) { Takeaway.new }

  describe 'List of dishes with prices' do
    it 'prints the list of dishes when promted' do
      expect(takeaway.show_menu('Restaurant')).to output('Restaurant Menu')
    end
  end
end
