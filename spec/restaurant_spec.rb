require 'restaurant'

describe Restaurant do
  describe "@menu" do
    it "stores a list of foods" do
      menu_double = double :menu
      restaurant = Restaurant.new(menu_double)
      expect(restaurant.menu).to eq menu_double
    end
  end

  describe "#view_menu" do
    it 'shows the user a menu of food and prices' do
      expect{subject.view_menu}.to output("hamburger: £0.99\nchicken nuggets: £2.99\ndouble cheeseburger: £1.99\nfries: £1.29\nmilkshake: £2.09\n").to_stdout
    end
  end
end
