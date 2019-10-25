require 'request_handler'

describe RequestHandler do
  subject { RequestHandler.new(params) }
  let(:params) { { 'Body' => "Make order\n1 x chicken\nfor £5", 'From' => '447747516382' } }
  let(:bad_params) { { 'Body' => "Make order\n1 x chicken\nfor £2", 'From' => '447747516382' } }
  let(:menu_params) { { 'Body' => "menu", 'From' => '447747516382' } }
  let(:exception_params) { { 'Body' => "adwadkwnadkwnk", 'From' => '447747516382' } }

  it 'is an instance of RequestHandler' do
    expect(subject).to be_an_instance_of RequestHandler
  end

  it 'has a body' do
    expect(subject).to respond_to :body
  end

  it 'has a from' do
    expect(subject).to respond_to :from
  end

  it 'has a response' do
    expect(subject).to respond_to :response
  end

  it 'makes a successful order' do
    expect(subject.response).to include 'Thank you!'
  end

  it 'does not allow bad order' do
    handler = RequestHandler.new(bad_params)

    expect(handler.response).to include 'Your total does not match'
  end

  it 'shows a menu' do
    handler = RequestHandler.new(menu_params)

    expect(handler.response).to include 'Menu:'
  end

  it 'handles non matching commands' do
    handler = RequestHandler.new(exception_params)

    expect(handler.response).to eq 'Type \'menu\' to view the menu'
  end
end