require 'takeaway'

describe Takeaway do
  subject(:takeaway){ Takeaway.new(:dish) }

  context '#list_dishes' do
    it 'lists the available dish' do
      expect(takeaway.list_dishes).to eq (:dish)
    end
  end

end
