
#-------
require 'rails_helper'
RSpec.describe Payment, type: :model do
  before :each do
    @user = User.create!(name: 'Kareem', email: 'kjosshn@gmail.com', password: '123456')
    @payment = Payment.create!(author: @user, name: 'example', amount: 30)
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@payment).to be_valid
    end

    it 'is not valid without a name' do
      @payment.name = nil
      expect(@payment).to_not be_valid
    end


    it 'is not valid without a amount' do
      @payment.amount = nil
      expect(@payment).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many payment' do
        expect(@user).to respond_to(:payments)
      end
  end

  describe 'attributes' do
    it 'has a name, amount, and user attribute' do
      @payment = Payment.new(name: 'example', amount: 1, author: @user)
      expect(@payment.name).to eq('example')
      expect(@payment.amount).to eq('1')
      expect(@payment.author).to be_instance_of(User)
    end
  end
end