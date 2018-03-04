require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {Takeaway.new}

  describe '#show_menu' do
    it 'shows the menu' do
      expect(subject.show_menu).to be_instance_of(Array)
    end
  end
  
  describe '#place_order' do #Need a context statement for multiple items.
    before do
      allow(subject).to receive(:gets).and_return("1", "2", "Y")
    end

    it 'prompts the user to enter multiple items' do
      expect{subject.place_order}.to change{subject.order.length}.by(1)
      subject.place_order 
    end
  end
end


