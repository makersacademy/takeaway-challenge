require 'order'

describe Order do
  it 'checks for existance of order class' do
    expect(subject).to be_instance_of(Order)
  end

  # it 'checks method select_dish exists' do
  #   expect(subject).to respond_to(:select_dish)
  # end

  it 'checks order returns an empty hash' do
    expect(subject.basket).to eq ({})
  end


end
