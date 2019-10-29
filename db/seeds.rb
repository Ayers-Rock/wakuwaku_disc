10.times do |n|
    Artist.create!(artist_name: "史上#{n}人目のアーティスト")
end

10.times do |n|
    Label.create!(label_name: "#{n}番目のレーベル")
end

10.times do |n|
    Genre.create!(genre_name: "#{n}個目のジャンル")
end

10.times do |n|
    Item.create!(
        artist_id: n + 1,
        label_id:  n + 1,
        genre_id:  n + 1,
        title:     "#{n}回目のCD",
        price:     1500,
        status:    0
    )
end

1.times do |n|
    User.create!(
        first_name:      "坂",
        last_name:       "押",
        first_kana_name: "サカ",
        last_kana_name:  "シ",
        postal_code:     "#{n}#{n}#{n}#{n}#{n}#{n}#{n}",
        prefecture:      "#{n}都道府県",
        city_address:    "#{n}市区町村#{n}番地",
        building:        "#{n}マンション#{n}号",
        tel_number:      "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}",
        email:           "#{n}@gmail.com",
        password:        "#{n}#{n}#{n}#{n}#{n}#{n}"
    )
end

Admin.create!(email: "admin@gmail.com", password: 123456)

10.times do |n|
    Stock.create!(
        item_id:       n + 1,
        arrival_count: "#{n + 1}",
        arrival_date:  '2019-10-20'
    )
end

10.times do |n|
    Disc.create!(
        item_id:    n + 1,
        disc_number: 1
    )
end

10.times do |n|
    Track.create!(
        disc_id:      n + 1,
        track_number: "#{n + 1}",
        track_name:   "#{n}丁目のおじさん"
    )
end

1.times do |n|
    Address.create!(
        user_id:         1,
        first_name:      "坂",
        last_name:       "押",
        first_kana_name: "サカ",
        last_kana_name:  "オシ",
        postal_code:     "#{n}#{n}#{n}#{n}#{n}#{n}#{n}",
        prefecture:      "#{n}都道府県",
        city_address:    "#{n}市区町村#{n}番地",
        building:        "#{n}マンション#{n}号"
    )
end

10.times do |n|
    CartItem.create!(
        user_id: 1,
        item_id: n + 1,
        amount:  "#{n + 1}"
    )
end

# 10.times do |n|
#     Order.create(
#         user_id:         n
#         postal_code:     "#{n}#{n}#{n}-#{n}#{n}#{n}#{n}",
#         prefecture:      "#{n}都道府県",
#         city_address:    "#{n}市区町村#{n}番地",
#         building:        "#{n}マンション#{n}号",
#         total_price:     "#{n}#{n}#{n}#{n}"
#         payment:
#     )
# end
