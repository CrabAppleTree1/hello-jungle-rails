require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

    it "is valid when given valid attributes" do
      @user = User.new(first_name: "Void", last_name: "Test", email: "at@gmail.com", password: "123456", password_confirmation: "123456")
      expect(@user).to be_valid
    end

    it "is not valid when first_name is empty" do
      @user = User.new(first_name: nil, last_name: "Test", email: "at@gmail.com", password: "123456", password_confirmation: "123456")
      expect(@user).to_not be_valid
    end
    
    it "is not valid when last_name is empty" do
      @user = User.new(first_name: "Void", last_name: nil, email: "at@gmail.com", password: "123456", password_confirmation: "123456")
      expect(@user).to_not be_valid
    end
    
    it "is not valid when email is empty" do
      @user = User.new(first_name: "Void", last_name: "Test", email: nil, password: "123456", password_confirmation: "123456")
      expect(@user).to_not be_valid
    end

    it "is not valid when password is empty" do
      @user = User.new(first_name: "Void", last_name: "Test", email: "at@gmail.com", password: nil, password_confirmation: "123456")
      expect(@user).to_not be_valid
    end

    it "is not valid when password confirmation is empty" do
      @user = User.new(first_name: "Void", last_name: "Test", email: "at@gmail.com", password: "123456", password_confirmation: nil)
      expect(@user).to_not be_valid
    end
    
    it "is not valid when password and confirmation do not match" do
      @user = User.new(first_name: "Void", last_name: "Test", email: "at@gmail.com", password: "123456", password_confirmation: "qqqqqq")
      expect(@user).to_not be_valid
    end

    it "is not valid when email is the same as another user" do
      @user = User.new(first_name: "Void", last_name: "Test", email: "at@gmail.com", password: "123456", password_confirmation: "123456")
      expect(@user).to be_valid
      @user.save!
      @user2 = User.new(first_name: "Void", last_name: "Test", email: "at@gMAIL.com", password: "123456", password_confirmation: "123456")
      expect(@user2).to_not be_valid
    end

    it "is not valid when password is less than 4 characters" do
      @user = User.new(first_name: "void", last_name: "test", email: "1@gmail.com", password: nil, password_confirmation: "123")
      expect(@user).to_not be_valid
    end
  end

    describe '.authenticate_with_credentials' do
      it 'should return if authentication is succesful' do
        @user = User.new(first_name: 'Jonny', last_name: 'Oliver', email: 'the@gmail.com', password: 'fairyDust1', password_confirmation: 'fairyDust1')
        @user.save
        expect(User.authenticate_with_credentials('the@gmail.com', 'fairyDust1')).to eq(@user)
      end

      it 'should succesfully login a session' do
        @user = User.create(first_name: 'Charlie', last_name: 'Oliver', email: 'CharlieOliver@gmail.com', password: 'tankandstuffandsjit', password_confirmation: 'tankandstuffandsjit')
        expect(User.authenticate_with_credentials('CharlieOliver@gmail.com', 'tankandstuffandsjit')).to eq(@user)
      end

      it 'should not login/return nil if a email is incorrect' do
        @user = User.create(first_name: 'Charlie', last_name: 'Oliver', email: 'CharlieOliver@gmail.com', password: 'tankandstuffandsjit', password_confirmation: 'tankandstuffandsjit')
        expect(User.authenticate_with_credentials('chrisOliver@gmail.com', 'tankandstuffandsjit')).to eq(nil)
      end

      it 'should not login/return nil if a password is incorrect' do
        @user = User.create(first_name: 'Charlie', last_name: 'Oliver', email: 'CharlieOliver@gmail.com', password: 'tankandstuffandsjit', password_confirmation: 'tankandstuffandsjit')
        expect(User.authenticate_with_credentials('CharlieOliver@gmail.com', 'iforget')).to eq(nil)
      end

      it 'should succesfully login a session even if whitespace is added on edge of email' do
        @user = User.create(first_name: 'Charlie', last_name: 'Oliver', email: 'CharlieOliver@gmail.com', password: 'tankandstuffandsjit', password_confirmation: 'tankandstuffandsjit')
        expect(User.authenticate_with_credentials(' CharlieOliver@gmail.com  ', 'tankandstuffandsjit')).to eq(@user)
      end

      it 'should succesfully login a session if they mis-case their typed email' do
        @user = User.create(first_name: 'Charlie', last_name: 'Oliver', email: 'CharlieOliver@gmail.com', password: 'tankandstuffandsjit', password_confirmation: 'tankandstuffandsjit')
        expect(User.authenticate_with_credentials('CharlieOliver@gMAil.Com', 'tankandstuffandsjit')).to eq(@user)
      end
      
    end

  
end
