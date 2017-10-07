require 'takeaway'

describe Takeaway do

subject(:takeaway) {described_class.new}

it 'has a menu on inititialisation' do
expect(takeaway.menu).to be_instance_of(Hash)
end

end
