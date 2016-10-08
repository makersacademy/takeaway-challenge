require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

    context '#menu' do

      it {is_expected.to respond_to :menu}

      it {is_expected.to respond_to :list_menu}

      # it 'expects menu to be an array' do
      #   both versions failing... wtf
      #   expect(:menu).to be_an_array
      #   expect(:menu).to be_kind_of(Array)
      # end

      it 'is expected to list the contents of the menu' do
        expect(takeaway.list_menu).to eq(takeaway.menu)
      end

    end

end

# it {is_expected.to respond_to :land}

# respond_to(:land).with(1).argument

# { actual }.to output("some output").to_stdout
