require 'spec_helper'

describe NullSubscription do
  describe '#charge' do
    it 'returns false' do
      expect(described_class.new.charge("")).to eq(false)
    end
  end

  describe '#has_mentoring?' do
    it 'returns false' do
      expect(described_class.new.has_mentoring?).to eq(false)
    end
  end

  describe '#price' do
    it 'returns 0' do
      expect(described_class.new.price).to eq(0)
    end
  end
end
