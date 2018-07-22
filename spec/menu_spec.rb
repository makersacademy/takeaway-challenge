require 'menu'

describe Menu do 
   let(:menu) {described_class.new}  
it 'has a print function' do 
    expect(menu).to respond_to(:display) 
end 
it 'displays list of items' do 
 expect(menu.display).to eq(menu.items)
end 
end 
