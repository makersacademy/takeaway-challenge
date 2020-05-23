require 'takeaway'

describe Takeaway do 

  context '#view_dishes' do
    it 'responds to takeaway object' do
      expect(subject).to respond_to(:view_dishes)
    end
  end

end
