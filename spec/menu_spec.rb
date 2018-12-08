require 'menu'

describe Menu do 
  let(:thai_menu) {Menu.new}
  let(:green_curry) {{:dish => 'green curry', :price => 5.99}}
  
  it 'on #display will show list of menu items' do 
    expect(thai_menu.list).to include(green_curry)
  end


  describe '#select' do 
    it 'should have a #select method that will ask for one param' do 
      expect(thai_menu).to respond_to(:select).with(1)
    end
  end
end 