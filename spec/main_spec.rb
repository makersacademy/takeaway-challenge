require 'main'

describe Main do

  subject(:user) {described_class.new}
  let(:show_menu) {double :show_menu}
  let(:view_basket) {double :view_basket, current_basket: {:Olives=>2.99}}
  let(:select_dish) {double :select_dish, current_basket: {:Olives=>2.99}}
  let(:italian) {double :italian, menu: {
    :Olives => 2.99,
    :Bruschetta => 3.99,
    :Arancini => 5.99,
    :Margherita => 9.99,
    :Carbonara => 12.99,
    :Pannacotta => 4.99,
    :Tiramisu => 4.99,
    :Wine => 12.99,
    :Coke => 2.49
  }}


  context "#show_menu" do

    it "recognises ability to call options" do
      expect(user).to respond_to(:show_menu)
    end

    it "should show menu" do
      expect(user.show_menu).to eq(italian.menu)
    end
  end

  context "#select_dish" do

    it "recognises select_dish method" do
      expect(user).to respond_to(:select_dish)
    end
  end

  context "#view_basket" do

    it "should return contents of basket" do
      user.select_dish("Olives")
      expect(user.view_basket).to eq({:Olives=>2.99})
    end
  end

end
