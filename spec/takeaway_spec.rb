require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

    context '#menu' do

      it {is_expected.to respond_to :menu}

      it {is_expected.to respond_to :list_menu}

      # it 'expects menu to be an array' do
      #   expect(takeaway.menu).to be_an_array
      # end

      it 'is expected to list the contents of the menu' do
        expect(takeaway.list_menu).to eq(takeaway.menu)
      end

      it 'expects the menu to return 2 hash values for each item' do
        expect(takeaway.menu).to include(food: 'pizza', price: 10)
      end

    end

end

# nclude entry: station, exit: nil

# it {is_expected.to respond_to :land}

# respond_to(:land).with(1).argument

# { actual }.to output("some output").to_stdout
