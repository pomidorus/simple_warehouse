require_relative '../test_helper'

describe Position do
  before do
    @position = Position.new(1, 2)
    @position_2 = Position.new(2, 2)
    @position_3 = Position.new(1, 2)
  end

  describe '#initialize' do
    it 'contains correct values' do
      assert_equal(1, @position.x)
      assert_equal(2, @position.y)
    end
  end

  describe '#==' do
    it 'returns true when equals to the same position' do
      assert_equal(true, @position == @position_3)
    end

    it 'returns false when equals to the same position' do
      assert_equal(false, @position == @position_2)
    end
  end

  describe '#hash' do
    it 'equals sum of x y hashes' do
      assert_equal((1.hash + 2.hash), @position.hash)
    end
  end
end
