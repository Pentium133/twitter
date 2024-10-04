require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let(:user) { create(:user) }

  describe "GET root" do
    context "when user is not signed in" do
      it "redirects to the login page" do
        get '/'
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is signed in" do
      before do
        sign_in user
      end

      it "renders the new template" do
        get "/"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
