user1 = User.create!(name: 'kareem')
category1 = Category.create!(user: user1, name: 'entertainment', icon: 'url here')
payment1 = Payment.create!(author: user1, name: 'buy product from amazon', amount: 270)
payment_for_category = CategoryPayment.create!(category: category1, payment: payment1)

pay1 = Payment.create!(author: user1, name: 'buy product from amazon', amount: 270)
pay2 = Payment.create!(author: user1, name: 'food', amount: 30)
pay3 = Payment.create!(author: user1, name: 'new camera', amount: 300)


CategoryPayment.create!(category: cat, payment: pay3)