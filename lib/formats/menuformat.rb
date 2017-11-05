require './lib/formats/formatter'

# MenuFormat is a formatting class. It is usually passed
# to Menu #format to get pretty printed menus.
class MenuFormat
  include Formatter

  DEFAULT_LENGTH = 40
  DEFAULT_INDEX_LENGTH = 5

  def initialize(length: DEFAULT_LENGTH, index_length: DEFAULT_INDEX_LENGTH)
    @index = @item = nil
    @length = length
    @index_length = index_length
  end

  def format(index, item)
    @index = index
    @item = item
    filled_content(2, '.').join(' ')
  end

  private

  def index_to_s
    "#{@index} |".rjust(@index_length)
  end

  def content
    [index_to_s, @item.title, @item.price]
  end
end
