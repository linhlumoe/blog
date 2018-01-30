require 'rails_helper'

RSpec.describe User, type: :model do
  # context 'build user' do
  #   before
  # end

  context 'validation' do
    # let(:) { FactoryBot.create(:user) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to define_enum_for(:role) }
  end

  context 'association' do
    it { is_expected.to have_many(:articles).class_name('Article') }
  end

  context 'new record' do
    before { @user = FactoryBot.build :user }

    it 'should set default role' do
      expect(@user.role).to eq 'visitor'
    end
  end
end

