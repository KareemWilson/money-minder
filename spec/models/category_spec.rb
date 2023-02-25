#-------
require 'rails_helper'
RSpec.describe Category, type: :model do
  before :each do
    @user = User.create!(name: 'Kareem', email: 'kjosshn@gmail.com', password: '123456')
    @category = Category.create!(user: @user, name: 'entertainment', icon: 'image.png')
  end

  context 'Testing Validations' do
    it 'is valid with valid attributes' do
      expect(@category).to be_valid
    end

    it 'is not valid without a name' do
      @category.name = nil
      expect(@category).to_not be_valid
    end

    it 'is not valid without a icon' do
      @category.icon = nil
      expect(@category).to_not be_valid
    end
  end

  context 'Testing Associations' do
    it 'has_many payments' do
      expect(@category).to respond_to(:payments)
    end

    it 'belongs_to user' do
      expect(@category).to respond_to(:user)
    end
  end

  describe 'attributes' do
    it 'has a name, icon, and user attribute' do
      expect(@category.name).to eq('entertainment')
      expect(@category.icon).to eq('image.png')
      expect(@category.user).to be_instance_of(User)
    end
  end
end
