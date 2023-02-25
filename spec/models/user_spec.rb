
require 'rails_helper'

RSpec.describe Payment, type: :model do
  before :each do
    @user = User.create!(name: 'Kareem', email: 'kjosshn@gmail.com', password: '123456')
    @category = Category.create!(user: @user, name: 'entertainment', icon: 'image.png')
    @payment = Payment.create!(author: @user, name: 'example', amount: 30)

  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'is not valid without a name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end


    it 'is not valid without a amount' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many payment' do
        expect(@user).to respond_to(:payments)
      end
  end

  describe 'attributes' do
    it 'has a name, email, and user attribute' do
      @user = User.new(name: 'example', email: 'test@example.com')
      expect(@user.name).to eq('example')
      expect(@user.email).to eq('test@example.com')
    end
  end
end