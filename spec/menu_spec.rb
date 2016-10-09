require "spec_helper"

describe Menu do

  describe '#view' do
    it 'returns the menu as a string' do
      expect(subject.view).to eq('fries ... £1.0')
    end
  end
end
