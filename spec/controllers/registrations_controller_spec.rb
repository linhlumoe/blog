require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe 'GET#index' do
    def do_request
      get :index
    end

    before { do_request }

    it 'render the :index view' do
      expect(response).to render_template :index
    end
  end
end
