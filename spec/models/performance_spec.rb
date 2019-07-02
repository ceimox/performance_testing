require 'rails_helper'

RSpec.describe Performance, type: :model do
  describe '#mid_number_between' do
    it 'performs at least 2M interactions per second' do
      expect { subject.mid_number_between_slow(70, 50, 60) }.to perform_at_least(2_000_000).ips
    end

    it 'performs at least 5M interactions per second' do
      expect { subject.mid_number_between_fast(70, 50, 60) }.to perform_at_least(5_000_000).ips
    end

    it 'performs at least 2 times faster than the old one' do
      expect {
        subject.mid_number_between_fast(70, 50, 60)
      }.to perform_faster_than {
        subject.mid_number_between_slow(70, 50, 60)
      }.at_least(2).times
    end
  end

  describe '#iterations' do
    it 'performs at least 1.1 times faster than the old one' do
      expect {
        subject.times_fast
      }.to perform_faster_than {
        subject.times_slow
      }.at_least(1.1).times
    end
  end

  describe '#pricing' do
    let(:prices) do
      { bread: 2_30, milk: 3_82, eggs: 2_97, juice: 2_98, cheese: 6_00 }
    end

    let(:items) do
      %i[juice eggs milk bread eggs cheese juice milk bread]
    end

    it 'returns the sum of the prices' do
      expect(subject.pricing_short(items, prices)).to eq 3014
      expect(subject.pricing_long(items, prices)).to eq 3014
    end

    it 'performs the same times' do
      expect {
        subject.pricing_short(items, prices)
      }.to perform_faster_than {
        subject.pricing_long(items, prices)
      }.at_least(1).times
    end
  end
end
