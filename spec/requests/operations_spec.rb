require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  before :example do
    @user = User.create(name: 'User 1', email: 'user@yahoo.com', password: '123456')
    @group = Group.create(name: 'Personal', icon: 'https://media.giphy.com/media/M9gbBd9nbDrOTu1Mqx/giphy.gif',
                          author_id: @user.id)
    sign_in @user
  end

  describe 'GET /index' do
    before :example do
      get group_operations_path(group_id: @group.id)
    end

    it 'should render index view' do
      expect(response).to render_template(:index)
    end

    it 'should have boilerplate text content' do
      expect(response.body).to include("Operations for #{@group.name}")
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /operations/new' do
    before :example do
      get new_operation_path
    end

    it 'should render index view' do
      expect(response).to render_template(:new)
    end

    it 'should have boilerplate text content' do
      expect(response.body).to include('Add Operations')
    end

    it 'should return http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
