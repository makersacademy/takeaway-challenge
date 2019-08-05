require 'item_list.rb'
require_relative './support/shared_examples_for_item_list.rb'

class ItemListTest
  include ItemList
end

describe ItemListTest do
  it_behaves_like ItemList
end
