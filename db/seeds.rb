# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#何のテーブル　何のカラムに何の値が入るか書いておく
cart_item = CartItem.create({user_id: 1 ,item_id: 4 ,amount: 4 })