require "menu"

describe Menu do 
  subject(:my_order) {described_class.new}
  it 'is expected to respond to print ' do 
    expect(my_order).to respond_to(:menu_list)
  end 

  it ' store the menu as a hash' do 
    expect(subject.menu_list).to be_a(Hash)
  end
end
