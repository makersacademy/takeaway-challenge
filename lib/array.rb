class Array

  def mick_inject(initial = nil, &block)

    return nil if empty_array?

    if initial.nil?
      initial = self[0]
      shift
      accumulate(initial, &block)
    else
      accumulate(initial, &block)
    end

  end

  def accumulate(initial, &block)
    accumulator = initial
    each do |a|
      accumulator = block.call(accumulator, a)
    end
    accumulator
  end

  def empty_array?
    count == 0
  end

end





