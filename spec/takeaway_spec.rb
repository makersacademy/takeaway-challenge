require 'takeaway'

describe Takeaway do

  it 'responds to .see_dishes' do
    expect(subject).to respond_to(:see_dishes)
  end

  it 'shows a list of dishes with prices' do
    subject.dishes = [{ name: "Pizza", price: 20 }]
    expect { subject.see_dishes.length }.to output("Name: Pizza |||| Price: £20\n").to_stdout
  end
  
  it 'responds to .select_dish' do
    expect(subject).to respond_to(:select_dish)
  end

  it 'adds selected dishes to array' do
    expect(subject).to receive(:gets).and_return("Pizza")
    expect(subject).to receive(:gets).and_return(2)
    expect(subject).to receive(:gets).and_return("exit")
    subject.select_dish
    expect(subject.basket.empty?).to eq false
  end

  it 'responds to .basket' do
    expect(subject).to respond_to(:basket)
  end

end
