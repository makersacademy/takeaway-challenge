require 'menu'

describe Menu do
  it 'can hold dishes and prices' do
    expect(subject.contents[0]).to eq({food: :Chips, price: 1})
  end

  it 'should respond to contents' do 
    expect(subject).to respond_to(:contents)
  end

  it 'should display menu' do
    expect do
      subject.show
    end.to output("1. Chips - £1\n2. Tofu - £2\n3. Broccoli - £1\n4. Ice_cream - £2\n").to_stdout
  end

end