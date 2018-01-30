require 'rails_helper'

RSpec.describe TimelinesController, type: :controller do
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
    it "assigns a blank timeline to the view" do
      get :new
      expect(assigns(:timeline)).to be_a_new(Timeline)
    end
  end

  describe "POST#create" do
    context "with valid attributes" do
      let(:timeline) { FactoryBot.attributes_for(:timeline) }

      it "creates a new timeline" do
        expect {
          post :create, timeline: timeline
        }.to change(Timeline,:count).by(1)
      end

      it "render the :index view" do
        post :create, timeline: timeline
        expect(response).to redirect_to timelines_path
      end
    end

    context "with invalid attributes" do
      let(:timeline) { FactoryBot.attributes_for(:invalid_timeline) }

      it "does not save the new timeline" do
        expect {
          post :create, timeline: timeline
        }.to change(Timeline,:count).by(0)
      end

      it "render the :index view" do
        post :create, timeline: timeline
        expect(response).to render_template :new
      end
    end
  end

  describe "GET#edit" do

    let(:timeline) { FactoryBot.create(:timeline) }

    it 'render the :edit view' do
      get :edit, id: timeline.id
      expect(response).to render_template :edit
    end

    it "assigns a blank timeline to the view" do
      get :edit, id: timeline.id
      expect(assigns(:timeline)).to eq(timeline)
    end
  end

  describe "PUT#update" do
    context "with valid attributes" do
      let(:timeline) { FactoryBot.create(:timeline) }

      it "located the requested @timeline" do
        put :update, id: timeline.id, timeline: FactoryBot.attributes_for(:timeline)
        expect(assigns(:timeline)).to eq(timeline)
      end

      it "changes @timeline's attributes" do
        put :update, id: timeline.id,
          timeline: FactoryBot.attributes_for(:timeline, date: Date.today, name_of_date: "Testing name_of_date", description: "Testing description")
        timeline.reload
        expect(timeline.date).to eq(Date.today)
        expect(timeline.name_of_date).to eq("Testing name_of_date")
        expect(timeline.description).to eq("Testing description")
      end

      it "redirects to the timeline#index" do
        put :update, id: timeline, timeline: FactoryBot.attributes_for(:timeline)
        expect(response).to redirect_to timelines_path
      end
    end

    context "with invalid attributes" do
      let(:timeline) { FactoryBot.create(:timeline, date: Date.today, name_of_date: "Testing name_of_date", description: "Testing description") }

      it "located the requested @timeline" do
        put :update, id: timeline.id, timeline: FactoryBot.attributes_for(:invalid_timeline)
        expect(assigns(:timeline)).to eq(timeline)
      end

      it "changes @timeline's attributes" do
        put :update, id: timeline.id,
          timeline: FactoryBot.attributes_for(:invalid_timeline)
        timeline.reload
        expect(timeline.date).to eq(Date.today)
        expect(timeline.name_of_date).to eq("Testing name_of_date")
        expect(timeline.description).to eq("Testing description")
      end

      it "render to the edit view" do
        put :update, id: timeline, timeline: FactoryBot.attributes_for(:invalid_timeline)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE#destroy' do

    before :each do
      @timeline = FactoryBot.create(:timeline)
    end

    it "deletes the timeline" do
      expect {
        delete :destroy, id: @timeline.id
      }.to change(Timeline,:count).by(-1)
    end

    it "redirects to timeline#index view" do
      delete :destroy, id: @timeline.id
      expect(response).to redirect_to timelines_path
    end
  end
end
