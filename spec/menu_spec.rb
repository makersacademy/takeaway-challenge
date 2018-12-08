require 'menu'

describe Menu do 
  let(:thai_menu) {Menu.new}
  let(:green_curry_details) {{:dish => 'green curry', :price => 5.99}}
  let(:dish) {'green curry'}
  
  context ' initialize' do

    it 'on #display will show list of menu items' do 
        expect(thai_menu.list).to include(green_curry_details)
    end

    it 'should have a data structure to store @choices' do 
        expect(thai_menu.choices).to eql([])
    end

  end


  describe ' #select' do 
    it 'should have a #select method that will ask for one param' do 
      expect(thai_menu).to respond_to(:select).with(1)
    end

    it' should return the array for the specified dish from @list' do 
        expect(thai_menu.select(dish)).to eql([green_curry_details])
    end

    it 'should place the selected dish into the @choices structure' do 
        expect{ thai_menu.select(dish) }.to change{thai_menu.choices.count}.by(1)
    end

    it 'should raise error if dish not found' do 
        expect{ thai_menu.select('non-existent-dish') }.to raise_error('dish not found')
    end
  end
end 