require 'takeaway'

describe Takeaway do
  describe 'Menu' do
    it 'displays a list of items to order from' do
      expect { subject.menu }.to output("Large chips - £2.45\nSmall chips - £2.00\nCod - £4.85\nPlaice - £4.85\nHaddock - £4.85\nFishcake - £1.15\nBattered sausage - £1.15\nSpring roll - £2.50\nBread roll - £0.55\nCurry sauce - £1.30\nMushy peas - £1.30").to_stdout
    end
  end
end
