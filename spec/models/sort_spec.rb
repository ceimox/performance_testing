require 'rails_helper'

RSpec.describe Sort, type: :model do
  describe '#mid_number_between' do
    it 'performs at least 2M interactions per second' do
      expect { subject.mid_number_between(70, 50, 60) }.to perform_at_least(2_000_000).ips
    end

    it 'performs at least 5M interactions per second' do
      expect { subject.mid_number_between_faster(70, 50, 60) }.to perform_at_least(5_000_000).ips
    end

    it 'performs at least 2 times faster than the old one' do
      expect {
        subject.mid_number_between_faster(70, 50, 60)
      }.to perform_faster_than {
        subject.mid_number_between(70, 50, 60)
      }.at_least(2).times
    end
  end

  describe '#number_array_to_hash' do
    let(:array) { [1, 1, 1, 1, 2, 2, 2, 3, 3] }
    let(:result) { {"1"=>4, "2"=>3, "3"=>2} }

    it 'returns a hash with the amount per number' do
      expect(subject.number_array_to_hash(array)).to eq result
      expect(subject.number_array_to_hash_faster(array)).to eq result
    end

    it 'performs at least 150k interactions per second' do
      expect { subject.number_array_to_hash(array) }.to perform_at_least(150_000).ips
    end

    it 'performs at least 350k interactions per second' do
      expect { subject.number_array_to_hash_faster(array) }.to perform_at_least(350_000).ips
    end

    it 'performs at least 2 times faster than the old one' do
      expect {
        subject.number_array_to_hash_faster(array)
      }.to perform_faster_than {
        subject.number_array_to_hash(array)
      }.at_least(2).times
    end
  end
end
