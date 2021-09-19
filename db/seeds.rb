puts "Cadastrando category...."
Category.create(description: "Bebidas")
Category.create(description: "Alimentos")

puts "Cadastrando product...."
Product.create(category_id: 1, description: "Coca Cola", price: 4.00, status: 1)
Product.create(category_id: 1, description: "Guaraná", price: 2.99, status: 1)
Product.create(category_id: 1, description: "Sprite", price: 3.50, status: 1)
Product.create(category_id: 1, description: "Cerveja Brahma", price: 2.88, status: 1)
Product.create(category_id: 1, description: "Cerveja Skol", price: 2.67, status: 1)

puts "Cadastrando product...."
Product.create(category_id: 2, description: "Leite condensando", price: 5.00, status: 1)
Product.create(category_id: 2, description: "Arroz", price: 15.00, status: 1)
Product.create(category_id: 2, description: "Feijão", price: 10.00, status: 1)