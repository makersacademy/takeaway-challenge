describe 'Basket' do

  let(:basket) {Basket.new}

  it 'can add items to the basket' do
    basket.add("Neapolitan", 2)
    expect(basket.contents.count).to eq 2
  end

  it 'can format the items in the basket for the user to view' do
    basket.add({:pizza => "Neapolitan", :price => 12.99}, 2)
    expect{basket.view()}.to output("Neapolitan x2, £25.98\n").to_stdout
  end

  it 'can calculate the total of all the items in the basket' do
    basket.add({:pizza => "Neapolitan", :price => 12.99}, 3)
    basket.add({:pizza => "Margherita", :price => 9.99}, 1)
    expect(basket.total).to eq 48.96
  end

  it 'can raise error if payment is less than total' do
    basket.add({:pizza => "Margherita", :price => 9.99}, 1)
    basket.add({:pizza => "Neapolitan", :price => 12.99}, 3)
    basket.total
    expect{basket.place_order(20)}.to raise_error "Please ensure the payment meets the order total"
  end
end