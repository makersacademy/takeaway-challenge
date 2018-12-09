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

  describe "#order" do
    it 'adds items to the order list' do
      takeaway.add
      expect(takaway.order).not_to be_empty
    end
    it 'gets user input for ordering' do
      allow(:takaway).to receive(:gets).and_return("food")
      expect(takeaway.order).to eq("food")
    end
  end
end
