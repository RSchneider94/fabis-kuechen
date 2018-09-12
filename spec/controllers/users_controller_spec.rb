require 'rails_helper'

describe UsersController, type: :controller do
  before do
    # @user = User.create!(
    #     first_name: 'Blaeue',
    #     last_name: 'Baduan',
    #     email: 'babuni@ga.com',
    #     password: 123321)
    @user = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in @user
      end

    it "loads the correct user details" do
      get :show, params: { id: @user.id }
      expect(response.status).to eq 200
      expect(assigns(:user)).to eq @user
    end
  end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

end