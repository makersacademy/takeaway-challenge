require 'takeaway'

describe TakeAway do

  subject(:takeaway) { described_class.new }
  
  describe '#menu' do
    it 'should list dishes' do
      expect{ takeaway.menu_list }.to output.to_stdout
    end

  end

  describe '#order' do
    
  end

  describe '#checkout' do
    
  end

end