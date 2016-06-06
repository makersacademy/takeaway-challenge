require 'confirmer'

describe Confirmer do
subject(:confirmer){described_class.new}

  describe '#check' do
    it 'asks for a confirmation' do
      expect(confirmer.check).to respond_to(:upcase)
    end

  end


end