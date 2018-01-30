require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET#index' do
    it 'render the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET#list' do
    it 'render the :list view' do
      get :list
      expect(response).to render_template :list
    end
  end

  describe "GET#new" do
    it "assigns a blank article to the view" do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end
  end

  describe "POST#create" do
    context "with valid attributes" do
      let(:article) { FactoryBot.attributes_for(:article) }

      it "creates a new article" do
        expect {
          post :create, article: article
        }.to change(Article,:count).by(1)
      end

      it "render the :index view" do
        post :create, article: article
        expect(response).to redirect_to articles_path
      end
    end

    context "with invalid attributes" do
      let(:article) { FactoryBot.attributes_for(:invalid_article) }

      it "does not save the new article" do
        expect {
          post :create, article: article
        }.to change(Article,:count).by(0)
      end

      it "render the :index view" do
        post :create, article: article
        expect(response).to render_template :new
      end
    end
  end

  describe "GET#edit" do

    let(:article) { FactoryBot.create(:article) }

    it 'render the :edit view' do
      get :edit, id: article.id
      expect(response).to render_template :edit
    end

    it "assigns a blank article to the view" do
      get :edit, id: article.id
      expect(assigns(:article)).to eq(article)
    end
  end

  describe "PUT#update" do
    context "with valid attributes" do
      let(:article) { FactoryBot.create(:article) }

      it "located the requested @article" do
        put :update, id: article.id, article: FactoryBot.attributes_for(:article)
        expect(assigns(:article)).to eq(article)
      end

      it "changes @article's attributes" do
        put :update, id: article.id,
          article: FactoryBot.attributes_for(:article, title: "Testing title", content: "Testing content", summary: "Testing summary", status: 1)
        article.reload
        expect(article.title).to eq("Testing title")
        expect(article.content).to eq("Testing content")
        expect(article.summary).to eq("Testing summary")
        expect(article.status).to eq(1)
      end

      it "redirects to the article#index" do
        put :update, id: article, article: FactoryBot.attributes_for(:article)
        expect(response).to redirect_to articles_path
      end
    end

    context "with invalid attributes" do
      let(:article) { FactoryBot.create(:article, title: "Testing title", content: "Testing content", summary: "Testing summary", status: 0) }

      it "located the requested @article" do
        put :update, id: article.id, article: FactoryBot.attributes_for(:invalid_article)
        expect(assigns(article)).to eq(@article)
      end

      it "changes @article's attributes" do
        put :update, id: article.id,
          article: FactoryBot.attributes_for(:invalid_article)
        article.reload
        expect(article.title).to eq("Testing title")
        expect(article.content).to eq("Testing content")
        expect(article.summary).to eq("Testing summary")
        expect(article.status).to eq(0)
      end

      it "render to the edit view" do
        put :update, id: article, article: FactoryBot.attributes_for(:invalid_article)
        expect(response).to render_template :edit
      end
    end
  end

  describe "GET#show" do
    let(:article) { FactoryBot.create(:article) }

    it "assigns the requested article to @article" do
      get :show, id: article.id
      expect(assigns(:article)).to eq(article)
    end

    it "renders the articles#show view" do
      get :show, id: article.id
      expect(response).to render_template :show
    end
  end

  describe 'DELETE#destroy' do

    before :each do
      @article = FactoryBot.create(:article)
    end

    it "deletes the article" do
      expect {
        delete :destroy, id: @article.id
      }.to change(Article,:count).by(-1)
    end

    it "redirects to articles#index view" do
      delete :destroy, id: @article.id
      expect(response).to redirect_to articles_path
    end
  end
end
