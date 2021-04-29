class Logic
  attr_reader :records
  def initialize(records)
    @records = records
  end

  def winner
    records[0]==records[1]==records[2]
  end
end