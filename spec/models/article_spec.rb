require 'rails_helper'

RSpec.describe Article, type: :model do

  context "db schema columns" do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:status).of_type(:integer) }
    it { should have_db_column(:summary).of_type(:string) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  context 'validation' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content) }
  end

  context 'association' do
    it { is_expected.to have_many(:comments).class_name('Comment') }
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'new record' do
    let(:article) { FactoryBot.build(:article) }

    it 'should set default status' do
      expect(article.status).to eq 0
    end
  end

  context 'article scope' do
    it 'applies a default scope by created_at desc' do
      expect(Article.all.to_sql).to eq Article.all.order(created_at: :desc).to_sql
    end

    it 'applies published_status scope' do
      expect(Article.published_status.to_sql).to eq Article.where(status: 1).to_sql
    end

    it 'applies starts_with scope' do
      expect(Article.starts_with('f').to_sql).to eq Article.where("title ilike ?", "%f%").to_sql
    end
  end

end
