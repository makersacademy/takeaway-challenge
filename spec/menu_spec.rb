require 'menu'

describe Menu do

  let(:dish_klass) {double(:dish_klass)}
  let(:dish) {double(:dish)}
  let(:dish2) {double(:dish)}
  let(:dish_list) { [ {name: :name_arg, price: :price_arg},
                      {name: :name_arg, price: :price_arg} ]
                    }

  subject(:menu) {described_class.new(dish_klass,dish_list)}

  before do
    allow(dish_klass).to receive(:new).with(:name_arg, :price_arg).and_return(dish,dish2)
    allow(dish).to receive(:name).and_return(:ordered_dish)
    allow(dish2).to receive(:name)
  end

  context "on menu creation" do

    it "initializes with an array of dish objects" do
      expect(menu.dishes).to include(dish,dish2)
    end

  end

  describe "#select_dish" do
    context "when selecting a dish to order" do
      it "selects a dish and adds it to the order" do
        expect(menu.select_dish(:ordered_dish)).to contain_exactly(dish)
      end
    end
  end

end