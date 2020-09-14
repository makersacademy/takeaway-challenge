require 'Takeaway'
describe '#select_dishes' do
  it 'select the dishes from list_of_dishes printed in the menu class' do
    selected_dishes = { dish: 'Ice Cream', price: 0.99 }
    expect (Takeaway.new.select_dishes).to include selected_dishes
  end
end




