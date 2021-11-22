require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Validations" do

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

    it "is not valid when password is less than 4 characters" do
      @user = User.new(first_name: "void", last_name: "test", email: "1@gmail.com", password: nil, password_confirmation: "123")
      expect(@user).to_not be_valid
    end
  end
  
end
