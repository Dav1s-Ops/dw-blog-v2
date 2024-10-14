require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      expect(user).to be_valid
    end

    it 'is invalid without an email' do
      user = User.new(email: nil, password: 'password123', password_confirmation: 'password123')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user = User.new(email: 'test@example.com', password: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid with a duplicate email' do
      User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      user = User.new(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'is invalid with a short password' do
      user = User.new(email: 'test@example.com', password: 'short', password_confirmation: 'short')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end

  describe 'Devise modules' do
    it 'sends a password recovery email when requested' do
      user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      expect { user.send_reset_password_instructions }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it 'remembers the user across sessions' do
      user = User.create!(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      user.remember_me!
      expect(user.remember_created_at).not_to be_nil
    end
  end
end
