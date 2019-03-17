require 'menu'
require 'takeaway'

describe Menu do 
  subject(:menu) {described_class.new}
  
  describe '#display_list' do 

    it 'displays all the dishes and prices' do   
      expect{subject.display_list}.to output("chinese 8\nfishandchips 7\nchicken 5\nbeef 6\n").to_stdout 
    end 
  end 

  it 'tells if dish is on menu' do
    expect(menu.has_dish?('chicken')).to be true
  end 



end 



