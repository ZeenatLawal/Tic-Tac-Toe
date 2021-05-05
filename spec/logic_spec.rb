require './lib/logic'

describe Logic do
  describe '#winner?' do
    let(:winx) { Logic.new([1, 'X', 3, 4, 'X', 6, 7, 'X', 9]) }
    let(:wino) { Logic.new([1, 2, 'O', 4, 5, 'O', 7, 8, 'O']) }
    let(:not_win) { Logic.new([1, 'X', 3, 4, 'X', 6, 'X', 'O', 'O']) }

    context 'X wins or not' do
      it 'returns true if X is the winner' do
        expect(winx.winner?('X')).to be true
      end
  
      it 'returns false if X is not the winner' do
        expect(not_win.winner?('X')).not_to be true
      end
    end
    
    context 'O wins or not' do
      it 'returns true if O is the winner' do
        expect(wino.winner?('O')).to be true
      end
  
      it 'returns false if O is not the winner' do
        expect(not_win.winner?('O')).not_to be true
      end
    end
  end
end
