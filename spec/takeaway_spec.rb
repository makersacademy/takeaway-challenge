require 'takeaway'

describe Takeaway do

  let(:dish){ double(name: 'dish1', price: 1) }
  let(:menu){ [dish, dish] }

  subject(:takeaway){ Takeaway.new(:menu) }

  context '#list_dishes' do
    it 'lists the available dishes' do
      expect(takeaway.list_dishes).to eq (:menu)
    end
  end

end
