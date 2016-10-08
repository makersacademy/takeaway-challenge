require 'menu'

describe Menu do
#subject(:menu) {described_class.new}
  # # before do
  # #   #expect(dishes).to respond_to(:save_new_dish).with(2).arguments
  # #   # allow(:add_dish_to_list).to receive(:dish).and_return('pizza')
  # #   # allow(:add_dish_to_list).to receive(:price).and_return('£10')
  # end

    describe "#initialize" do
      it "initialize with the current menu of dishes" do
      expect(subject.current_menu).to be_a_kind_of Array
      end
    end

    describe "#select_a_dish" do
      it "retrieves the ordered dish from the menu" do
        expect(subject.select_a_dish(111)).to eq({dish_category: 'Dessert:', dish_number: 111, dish: 'tart', price: 7})
      end
    end

    # describe "#{print_menu}", focus: true do
    #   it "print the menu on the screen" do
    #     expect(subject.print_menu).to be_a_kind_of String
    #   end
    # end

  end
