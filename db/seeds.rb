user1 = User.create!(name: 'kareem')
category1 = Category.create!(user: user1, name: 'entertainment', icon: 'url here')
payment1 = Payment.create!(author: user1, name: 'buy product from amazon', amount: 270)
payment_for_category = CategoryPayment.create!(category: category1, payment: payment1)
