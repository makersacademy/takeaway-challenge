require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish) { double "burrito" }

  it 'responds to dishes' do
    expect(menu).to respond_to(:dishes)
  end

  context 'Dish added to menu' do
    before { menu.add_dish("burrito") }

    describe '#dishes' do
      it 'dishes can be added to menu' do
        expect(menu.dishes).to include("burrito")
      end
    end

    describe "#list_dishes" do
      specify { expect { menu.list_dishes }.to output("burrito").to_stdout }
    end

  end

end
