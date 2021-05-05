require './lib/draw'

describe Draw do
  describe '#draw?' do
    let(:draw) { Draw.new(%w[X X O X O O X O X]) }
    let(:not_draw) { Draw.new(['X', 'X', 'O', 4, 5, 6, 7, 8, 9]) }

    it 'returns true if board contains strings' do
      expect(draw.draw?).to be true
    end

    it 'returns false if board contains integers' do
      expect(not_draw.draw?).to be false
    end
  end
end
