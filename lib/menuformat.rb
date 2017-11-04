#!/usr/bin/env ruby

# MenuFormat is a formatting class. It is usually passed
# to Menu #format to get pretty printed menus.

class MenuFormat

  DEFAULT_INDEX_LENGTH = 5
  DEFAULT_LENGTH = 40

  def initialize(length: DEFAULT_LENGTH, index_length: DEFAULT_INDEX_LENGTH)
    @index = @item = nil
    @default_length = length
    @default_index_length = index_length
  end

  def format(index, item)
    @index = index
    @item = item
    filled_content.join(' ')
  end

  private

  def index_to_s
    "#{@index} |".rjust(@default_index_length)
  end

  def content
    [index_to_s, @item.title, @item.price]
  end

  def content_length
    # add content.length to account for spacing
    content.map { |item| item.length }.reduce(0, :+) + content.length
  end

  def get_fill(char = '.')
    ''.ljust(@default_length - content_length, char)
  end

  def filled_content(insert_at = 2)
    content.insert(insert_at, get_fill)
  end
end
