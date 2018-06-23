require 'menu'
require 'order'

describe Menu do

  describe "show dishes" do
    it { is_expected.to respond_to :show_menu }

    subject(:menu) { described_class.new }

    it "shows a list of dishes" do
      expect(menu.show_menu).to eq(menu.english_menu)
          end
        end
      end



    # describe "add dishes" do
    #   it { is_expected.to respond_to(:add_to_basket).with(1).argument }
    #
    #   it "should add food to the basket" do
    #     t = TakeAway.new
    #     food = "spring roll"
    #     basket = [food]
    #     expect(subject.add_to_basket(food)).to eq(basket)
    #   end
    #
    #   it "should print: added to the the basket" do
    #     t = TakeAway.new
    #     food = "spring roll"
    #     basket = [food]
    #     expect(subject.add_to_basket(food)).to eq("added to the basket")
    #
    #   end
    # end
