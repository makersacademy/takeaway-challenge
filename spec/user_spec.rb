require 'user'

describe User do
  let(:menu_dub) { double :a_menu }
  let(:order_list) { double :an_order_list}
  subject(:user) { described_class.new(menu_dub, order_list) }
  let(:item) { double :item }
  let(:quantity) { double :quantity }
  let(:menu_items) { { :margherita => 7.50, :pepperoni => 10.50,
                 :calzone => 12.50, :diavola => 10.50 }
  }

  describe "#view_menu" do
    it "shows the menu" do
      allow(menu_dub).to receive(:menu) { menu_items }
      expect(subject.view_menu). to eq menu_items
    end
  end

  # describe "#select" do 
  #   it "it adds user selection and quanity to order_list" do
  #     user.add(item, quantity)
  #   end
  # end
end
