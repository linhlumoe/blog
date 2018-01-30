require 'rails_helper'

RSpec.describe Timeline, type: :model do
  context "db schema columns" do
    it { should have_db_column(:name_of_date).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:picture).of_type(:string) }
    it { should have_db_column(:date).of_type(:datetime) }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:name_of_date) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_length_of(:name_of_date) }
    it { is_expected.to validate_length_of(:description) }
  end

  context 'new record' do
    let(:timeline) { FactoryBot.build(:timeline) }

    it 'should be valid' do
      expect(timeline).to be_valid
    end
  end
end
