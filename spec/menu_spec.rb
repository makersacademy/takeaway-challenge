require 'menu'

describe Menu do 
  let(:thai_menu) {Menu.new}
  let(:green_curry_details) {{:dish => 'green curry', :price => 5.99}}
  let(:dish) {'green curry'}
  let(:quantity) {2}
  
  context ' initialize' do

    it 'on #display will show list of menu items' do 
        expect(thai_menu.list).to include(green_curry_details)
    end

    it 'should have a data structure to store @choices' do 
        expect(thai_menu.choices).to eql([])
    end

  end


  describe ' #select' do 
    let(:green_curry_details_and_quantity) {{:dish => 'green curry', :price => 5.99, :quantity =>2}}
    it 'should have a #select method that will ask for two params' do 
      expect(thai_menu).to respond_to(:select).with(2)
    end

    it' should return the array for the specified dish from @list' do 
        expect(thai_menu.select(dish, quantity )).to eql([green_curry_details_and_quantity])
    end

    it 'the returned array should include a quanitity key pair made from user input' do 
    end 

    it 'should place the selected dish into the @choices structure' do 
        expect{ thai_menu.select(dish, quantity) }.to change{thai_menu.choices.count}.by(1)
    end

    it 'should raise error if dish not found' do 
        expect{ thai_menu.select('non-existent-dish', quantity) }.to raise_error('dish not found')
    end
  end
end 