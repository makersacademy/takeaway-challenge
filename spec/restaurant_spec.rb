require 'restaurant.rb'
describe Restaurant do

  context 'menu' do

    it 'should be an array' do
      expect(Restaurant.new.menu).to be_an_instance_of(Array)
    end

    it 'should print menu when requested' do
      expect(Restaurant.new.print_menu).to eq "Takeaway Menu \n1. Chicken £6 \n2. Pizza £10 \n3. Kebab £4 \n4. Chips £2 \n5. Fish £5 \n6. Curry £9 \n"
    end
  end

end
