require 'menu'


 describe "menu" do
      it "is initialised with a hash of dishes by default" do
          menu1 = Menu.new
        expect(menu1.food_list).to eq({:Rice=>2.5, :Salad=>3.4, :Cheese=>2.9, :Samon=>1.5, :Bacon=>2.45 })
      end
    end