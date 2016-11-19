require 'takeaway'

describe Takeaway do

  let(:takeaway) {described_class.new}

  context "Initialization" do

    it 'expects takeaway to initialize with a menu full of items' do
      expect(takeaway.menu).not_to be_empty
    end

    it 'expects a certain item to be in menu variable' do
      expect(takeaway.menu).to include {'Athena'}
    end
  end

  context 'Placing orders' do

    it 'tests if a dish can be added to the basket' do
      takeaway.add_to_basket("Margherita")
      expect(takeaway.order).to eq ["Margherita"]
    end
  end

end
