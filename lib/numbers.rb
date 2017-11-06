require 'pstore'

class Numbers
  attr_reader :pstore
  DEFAULT_PATH = './numbers.pstore'

  def initialize(storage_class: PStore)
    @pstore = storage_class.new(DEFAULT_PATH)
  end

  def has?(item)
    pstore.transaction { pstore[item] == true }
  end

  def set(item)
    pstore.transaction { setitem(item, true) }
  end

  def clear(item)
    pstore.transaction { setitem(item, nil) }
  end

  def setitem(item, value)
    pstore[item] = value
  end
end
