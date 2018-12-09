require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }

  describe '#show_menu' do
    it 'subject shows menu' do
      expect(takeaway).to respond_to(:show_menu)
    end

    it 'shows a list of menu items' do
      expect(takeaway.show_menu).to be_an_instance_of(Array)
    end
  end
end
