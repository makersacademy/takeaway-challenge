require 'menu'

describe Menu do
  let(:takeaway) { Menu.new }
  let(:dish) { double :dish_class}
  let(:takeaway) { Menu.new(dish) }

  context '#initialize' do

    context 'with parameters' do

      it 'shoul use specified values' do
        expect(takeaway.menu).to eq

      end

    end

  end

end
