user1 = User.create!(name: 'kareem')
category1 = Category.create!(user: user1, name: 'entertainment', icon: 'url here')
payment1 = Payment.create!(user: user1, name: 'buy product from amazon', amount: 270)
category_payment = CategoryPayment.create!(category: category1, payment: payment1)