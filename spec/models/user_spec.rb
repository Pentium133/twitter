# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:followers) }
    it { is_expected.to have_many(:users).through(:followers) }
    it { should have_many(:following).class_name('Follower').with_foreign_key('follower_id').dependent(:destroy) }
  end

  describe 'follow_to' do
    let(:user) { create(:user) }
    let(:other_user) { create(:user) }

    context 'when the user is follower' do
      it 'creates a follow relationship' do
        expect {
          user.follow_to(other_user)
        }.to change(Follower, :count).by(1)

        expect(user.followers.exists?(other_user)).to be_truthy
      end
    end
  end
end
