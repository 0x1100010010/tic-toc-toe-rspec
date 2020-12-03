# Module to get if there is a winner
module Checker
  def check_winner(data)
    @data = data
    arr = [check_row, check_column, check_diagonal]
    return 1 if arr.any?(1)
    return 2 if arr.any?(2)
  end

  def check_row
    @data.each do |arr|
      return 1 if arr.all?('X')
      return 2 if arr.all?('O')
    end
  end

  def check_column
    0.upto(2) do |i|
      ar = []
      @data.each do |arr|
        ar << arr[i]
      end
      return 1 if ar.all?('X')
      return 2 if ar.all?('O')
    end
  end

  def check_diagonal
    ar = []
    arrr = []
    i = 0
    @data.each do |arr|
      ar.push(arr[i])
      arrr.push(arr[2 - i])
      i += 1
    end
    return 1 if ar.all?('X') || arrr.all?('X')
    return 2 if ar.all?('O') || arrr.all?('O')
  end
end
