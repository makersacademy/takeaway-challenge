require 'user'

describe User do
  it 'the user can make a selection through stdin' do
    expect(subject.user_selection).to eq gets.chomp
  end

  it 'the user can make several selections through stdin' do

  end

  it 'saves the users selection to a file' do
  end

end
