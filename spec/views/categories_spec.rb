require 'rails_helper'

RSpec.describe 'Category Page', type: :feature do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Example', email: 'example@gmail.com', password: '123456')
    @category = Category.create(name: 'HealthCare', icon: 'health.png', user: @user)
    sign_in @user
  end

  describe 'GET /index' do
    before :each do
      visit categories_path
    end

    it 'Show categories' do
      expect(page).to have_content('HealthCare')
    end

    it 'Show category\'s transactions' do
      click_link 'HealthCare'
      expect(current_path).to eq(category_payments_path(@category))
    end
  end
end
