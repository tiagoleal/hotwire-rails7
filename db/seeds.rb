puts "Register users...."
User.create(name: 'thiago', email: 'thiago@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'leal', email: 'leal@gmail.com', password: '123456', password_confirmation: '123456')
User.create(name: 'jeff', email: 'jeff@gmail.com', password: '123456', password_confirmation: '123456')

puts "Register category...."
Category.create(description: "Bebidas")
Category.create(description: "Alimentos")

puts "Register product...."
Product.create(category_id: 1, code: "0001", description: "Coca Cola", price: 4.00, status: 1)
Product.create(category_id: 1, code: "0002", description: "Guaraná", price: 2.99, status: 1)
Product.create(category_id: 1, code: "0003", description: "Sprite", price: 3.50, status: 1)
Product.create(category_id: 1, code: "0004", description: "Cerveja Brahma", price: 2.88, status: 1)
Product.create(category_id: 1, code: "0005", description: "Cerveja Skol", price: 2.67, status: 1)

puts "Register product...."
Product.create(category_id: 2, code: "0006", description: "Leite condensando", price: 5.00, status: 1)
Product.create(category_id: 2, code: "0007", description: "Arroz", price: 15.00, status: 1)
Product.create(category_id: 2, code: "0008", description: "Feijão", price: 10.00, status: 1)

puts "Order...."
Order.create(user_id: 1, status: 'waiting')
Order.create(user_id: 2, status: 'waiting')

puts "OrderProduct...."
OrderProduct.create(order_id: 1, product_id: 1, unit_price: 4.00, quantity: 1)
OrderProduct.create(order_id: 2, product_id: 2, unit_price: 6.00, quantity: 1)
OrderProduct.create(order_id: 3, product_id: 2, unit_price: 2.99, quantity: 1)
