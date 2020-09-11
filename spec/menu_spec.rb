require 'Menu'

describe Menu do
  # defining list_of_dishes as an array of hashes
  let(:list_of_dishes) do
    [
         { dish: 'Fries', price: 1.99 },
         { dish: 'Cheeseburger', price: 2.99 },
         { dish: 'Coke', price: 0.99 },
         { dish: 'Salad', price: 1.99 },
         { dish: 'Ice Cream', price: 0.99 }
     ]
  end

  subject { Menu.new } # set the subject new menu
  it { is_expected.to respond_to(:list_of_dishes) } # the subject is expected to respond to the list of dishes

  describe '#print_menu' do # prints the menu
    it 'returns the list of dishes with prices' do
      expect(subject.print_menu).to eq(list_of_dishes)
    end
  end
end

