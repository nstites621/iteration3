require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'New user registration' do
      context 'When new registration is successful' do
        it 'nickname and email, password and password_Being able to register if confirmation exists' do
          expect(@user).to be_valid
        end
        it 'You can register if your password is 6 characters or more' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user).to be_valid
        end
      end

      context 'When new registration does not go well' do
        it 'Cannot register if email is empty' do
          @user.email = nil
          @user.valid?
          expect(@user.valid?).to eq(false)
        end
        it 'Cannot register if there are duplicate emails' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(@user.valid?).to eq(true)
        end
        it 'Cannot register if password is empty' do
          @user.password = nil
          @user.valid?
          expect(@user.valid?).to eq(false)
        end
        it 'password even if password exists_Confirmation cannot be registered if it is empty' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.valid?).to eq(false)
        end
        it 'Cannot register if password is 5 characters or less' do
          @user.password = '12345'
          @user.password_confirmation = '12345'
          @user.valid?
          expect(@user.valid?).to eq(false)
        end
      end
    end
  end
end