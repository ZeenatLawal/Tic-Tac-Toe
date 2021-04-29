class Logic
  attr_reader :rec, :wins

  def initialize(records)
    @rec = records
    @wins = [[@rec[0], @rec[1], @rec[2]],
             [@rec[3], @rec[4], @rec[5]],
             [@rec[6], @rec[7], @rec[8]],
             [@rec[0], @rec[3], @rec[6]],
             [@rec[1], @rec[4], @rec[7]],
             [@rec[2], @rec[5], @rec[8]],
             [@rec[0], @rec[4], @rec[8]],
             [@rec[2], @rec[4], @rec[6]]]
  end

  def winner?(player)
    @winner = false
    @winner = true if @wins.any? do |array|
      array.all? { |item| item == player }
    end
    @winner
  end
end
