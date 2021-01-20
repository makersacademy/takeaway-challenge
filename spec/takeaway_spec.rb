require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to :menu }

  describe '#list_menu' do

    it { is_expected.to respond_to :list_menu } 

    it 'lists menu' do 
      expected_result = Takeaway.new.menu.each { |key, value| puts "#{key} is £#{value}" }
      expect(subject.list_menu).to eq(expected_result)
    end  
    
  end  

end 