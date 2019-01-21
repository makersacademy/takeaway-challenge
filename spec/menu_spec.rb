require 'menu'

describe Menu do

  dishes =
"1 Chicpeas Jungle       £12,95
2 Brocoli Bush          £9,95
3 Aspargus Forest       £11,95
4 Lentils Peak          £8,95
5 Banana Curnicopia     £6,95
"
  it 'returns a list of dishes with prices' do
    expect { subject.display }.to output(dishes).to_stdout
  end

  it 'confirms it created an order' do
    dish = "Banana Curnicopia"
    message = "1 #{dish} has been added to your order
    "
    expect { subject.order(dish: dish)}.to output(message).to_stdout
  end

  # it 'create a new order'
  #   expect { subject.order(dish:1,2)}.to

end
