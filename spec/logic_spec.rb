require './lib/logic'

describe Logic do
  describe '#winner?' do
    let (:win) {Logic.new([1, 'X', 3, 4, 'X', 6, 7, 'X', 9])}
    let (:not_win) {Logic.new([1, 'X', 3, 4, 'X', 6, 'X', 'O', 'O'])}
    
    it 'returns true if there is a winner' do 
      expect(win.winner?('X')).to be true
    end

    it 'returns false if there is no winner' do 
      expect(not_win.winner?('O')).to be false
    end
  end
end
