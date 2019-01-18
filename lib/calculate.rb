module Calculate
  def self.add(array)
    array.map { |arr|
      arr[1] * arr[2]
    }.reduce(:+)
  end
end