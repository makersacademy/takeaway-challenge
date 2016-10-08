require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

    context '#menu' do

      it 'expects takeaway to have a menu' do
        expect(takeaway).to respond_to :menu
      end

    end

end

# it {is_expected.to respond_to :land}
