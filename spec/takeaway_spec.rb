require 'takeaway'

describe Takeaway do

  let(:takeaway)    { Takeaway.new(basket_class, text_class) }
  let(:basket_class){ double(:basket_class, new: basket) }
  let(:basket)      { double(:basket, total_cost: 10) }
  let(:text_class){ double(:text_class, new: text_sender) }
  let(:text_sender) { double(:text_sender) }

  it 'can ask the menu for a list of dishes' do
    expect(basket).to receive(:show_menu)
    takeaway.show_menu
  end

  it 'can ask the basket to add an item' do
    expect(basket).to receive(:add_item)
    takeaway.add_to_basket('Margherita', 1)
  end

  it 'can ask the basket for the items in the basket' do
    expect(basket).to receive(:basket)
    takeaway.get_basket
  end

  it 'can ask the basket for the total' do
    expect(basket).to receive(:total_cost)
    takeaway.get_cost
  end

  it 'can check if the price is correct' do
    expect(takeaway.correct_price?(10)).to eq(true)
  end

  it 'can raise an error if expected value is not the same as total' do
    expect { takeaway.checkout(5) }.to raise_error("Price given is not equal to actual price")
  end

  it 'can ask the text sender to send a text' do
    expect(text_sender).to receive(:send_message)
    takeaway.checkout(10)
  end

end
