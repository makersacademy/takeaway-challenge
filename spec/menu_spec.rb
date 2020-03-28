require 'menu'

describe Menu do

  describe '#view' do
    it 'should display a list of dishes with prices' do
      expect(subject.view).to eq "1. Pie - £6\n2. Mash - £4\n3. Chips - £5"
    end
  end
  describe '#provide_dish' do
    it 'returns a Pie object when passed 1' do
      expect(subject.provide_dish(1)).to be_kind_of(Pie)
    end 
  end
end