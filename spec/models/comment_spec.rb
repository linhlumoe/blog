require 'rails_helper'

RSpec.describe Comment, type: :model do

  context "db schema columns" do
    it { should have_db_column(:commenter).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:phone).of_type(:string) }
    it { should have_db_column(:text).of_type(:text) }
    it { should have_db_column(:article_id).of_type(:integer) }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:commenter) }
    it { is_expected.to validate_presence_of(:text) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_length_of(:commenter) }
    it { is_expected.to validate_length_of(:text) }
    it { is_expected.to validate_length_of(:name) }
    it { is_expected.to validate_length_of(:phone) }
  end

  context 'association' do
    it { is_expected.to belong_to(:article).class_name('Article') }
  end

  context 'new record' do
    let(:comment) { FactoryBot.build(:comment) }

    it 'should be valid' do
      expect(comment).to be_valid
    end
  end

  context 'comment scope' do
    it 'applies a default scope by created_at desc' do
      expect(Comment.all.to_sql).to eq Comment.all.order(created_at: :desc).to_sql
    end
  end
end
