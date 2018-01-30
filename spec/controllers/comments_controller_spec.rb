require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "POST#create" do
    context "with valid attributes" do
      let(:comment) { FactoryBot.attributes_for(:comment) }

      it "creates a new comment" do
        expect {
          post :create, comment: comment, :format => 'js'
        }.to change(Comment,:count).by(1)
      end
    end

    context "with invalid attributes" do
      let(:comment) { FactoryBot.attributes_for(:invalid_comment) }

      it "does not save the new comment" do
        expect {
          post :create, comment: comment, :format => 'js'
        }.to change(Comment,:count).by(0)
      end
    end
  end

  describe 'DELETE#destroy' do

    before :each do
      @comment = FactoryBot.create(:comment)
    end

    it "deletes the timeline" do
      expect {
        delete :destroy, id: @comment.id, :format => 'js'
      }.to change(Comment,:count).by(-1)
    end
  end
end
