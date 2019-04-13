require 'takeaway'

describe Takeaway do
  describe '#view_dishes' do
    dishes = { fish: 5, chips: 2, curry_sauce: 1 }
    it { expect(subject.view_dishes).to eq dishes }
  end
end
