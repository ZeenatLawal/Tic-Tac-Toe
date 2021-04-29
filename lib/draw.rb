class Draw
  attr_reader :rec

  def initialize(records)
    @rec = records
  end

  def draw?
    @rec.all? do |item|
      item.is_a?(String)
    end
  end
end
