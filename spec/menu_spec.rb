require 'menu.rb'
describe Menu do

    it 'shows the whole Menu' do
        menu = Menu.new
        expect(menu.dish_list).to eq ({:"Bruschetta"=> 2.00,:"Spaghetti Pomodoro"=> 5.00,:"Almond Cake"=> 4.00})
    end
    
end