require 'available_dishes'

describe AvailableDishes do
  let(:margherita) { double(:margherita_double, name: "Margherita", price: 7) }
  let(:pepperoni) { double(:pepperoni_double, name: "Pepperoni", price: 8) }
  let(:ham_and_mushroom) { double(:ham_and_mushroom_double, name: "Ham and mushroom", price: 9) }
  let(:array_of_dishes) { [margherita, pepperoni, ham_and_mushroom] }
  let(:available_dishes) { AvailableDishes.new(array_of_dishes) }

  it 'should print available dishes and prices' do
    expected_message = "Margherita - £7\nPepperoni - £8\nHam and mushroom - £9"
    expect(available_dishes.show_dishes).to eq expected_message
  end
end
