require_relative '../app'

describe App do
  it 'should return menu upon accessing homepage' do
    get '/'

    expect(last_response).to be_ok
  end
end
