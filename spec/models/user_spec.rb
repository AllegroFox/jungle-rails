require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should pass all validations' do
      @user = User.new(first_name: 'Fox', last_name: 'Socks', email: 'AllegroFox@test.com', password: 'Foxy', password_confirmation: 'Foxy')
      expect(@user).to be_valid
    end

    it 'must have a password' do
      @user = User.new(first_name: 'Fox', last_name: 'Socks', email: 'AllegroFox@test.com', password: nil, password_confirmation: 'Foxy')
      expect(@user).to_not be_valid
    end

    it 'must have a password with at least three characters' do
      @user = User.new(first_name: 'Fox', last_name: 'Socks', email: 'AllegroFox@test.com', password: 'to', password_confirmation: 'to')
      expect(@user).to_not be_valid
    end

    it 'must have a matching password_confirmation' do
      @user = User.new(first_name: 'Fox', last_name: 'Socks', email: 'AllegroFox@test.com', password: 'Foxy', password_confirmation: 'Box')
      expect(@user).to_not be_valid
    end

    it 'must have a unique email' do
      @user1 = User.create(first_name: 'Fox', last_name: 'Socks', email: 'AllegroFox@test.com', password: 'Foxy', password_confirmation: 'Foxy')
      @user2 = User.new(first_name: 'Fox', last_name: 'Socks', email: 'AllegroFox@test.com', password: 'test', password_confirmation: 'test')
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
    end

    it 'must have a first_name' do
      @user = User.new(first_name: nil, last_name: 'Socks', email: 'AllegroFox@test.com', password: 'Foxy', password_confirmation: 'Foxy')
      expect(@user).to_not be_valid
    end

    it 'must have a last_name' do
      @user = User.new(first_name: 'Fox', last_name: nil, email: 'AllegroFox@test.com', password: 'Foxy', password_confirmation: 'Foxy')
      expect(@user).to_not be_valid
    end

  end
end
