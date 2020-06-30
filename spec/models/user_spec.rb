require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    context 'Passwords' do

      it 'should match password and password confirmation' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "mike"
        )
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'should have a valid password' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        expect(@user.errors.full_messages).not_to include("Password can't be blank")
      end

      it 'should have a confirm password' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        expect(@user.errors.full_messages).not_to include("Password confirmation can't be blank")
      end

      it 'should have password length >= 4' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        result = @user.save

        expect(result).to be(true)
        expect(@user.errors.full_messages).not_to include("Password is too short (minimum is 4 characters)")
      end

    end

    context "Email" do

      it 'should have an email' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        expect(@user.errors.full_messages).not_to include("Email can't be blank")
      end

      it 'should be unique' do
        @user1 = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        @user1.save

        @user2 = User.create(
          first_name: "Jane",
          last_name: "Doe",
          email: "TEST@EXAMPLE.com",
          password: "test",
          password_confirmation: "test"
        )
        @user2.save

        expect(@user2.errors.full_messages).to include("Email has already been taken")

      end
    end

    describe ".authenticate_with_credentials" do

      it 'should register user with complete credentials' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        @user.save
        @user = User.authenticate_with_credentials("test@example.com", "test")
        expect(@user).not_to be(nil)
      end

      it 'should not register user with invalid credentials' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        @user.save
        @user = User.authenticate_with_credentials("test@example.com", "password")
        expect(@user).to be(nil)
      end

      it 'should authenticate email with whitespace(s)' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        @user.save
        @user = User.authenticate_with_credentials(" test@example.com ", "test")
        expect(@user).not_to be(nil)
      end

      it 'should authenticate email with wrong cases' do
        @user = User.create(
          first_name: "John",
          last_name: "Doe",
          email: "test@example.com",
          password: "test",
          password_confirmation: "test"
        )
        @user.save
        @user = User.authenticate_with_credentials("tEsT@eXaMPle.com", "test")
        expect(@user).not_to be(nil)
      end
    
    end

  end
end
