require_relative '../lib/takeaway'

describe Takeaway do
  
  # 1. As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  describe "#view_menu" do
    it "displays a menu containing dishes and its price" do
      menu = double(:menu)
      allow(menu).to receive(:menu_list).and_return({
        'rice' => 2,
        'chicken' => 3,
        'soup' => 2
      })
      expect(subject.view_menu).to eq menu.menu_list
    end
  end

  # 2. As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  # 4. As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text after I have ordered

  # describe "#confirm" do
  #   it "send text message when order placed" do
  #     subject.select_dish("chicken")
  #     subject.check_order
  #     expect(subject.confirm).to eq "Thanks for your order! It will be with you at #{Time.now}"
  #   end 
  # end
end
