100.times do |n|
    Artist.create(artist_name: "史上#{n}人目のアーティスト")
end

100.times do |n|
    Label.create(label_name: "#{n}番目のレーベル")
end

100.times do |n|
    Genre.create(genre_name: "#{n}個目のジャンル")
end

100.times do |n|
    Item.create(
        artist_id: "#{n}",
        label_id:  "#{n}",
        genre_id:  "#{n}",
        title:     "#{n}回目のCD",
        price:     1500,
        status:    0
    )
end

100.times do |n|
    User.create(
        first_name:      "#{n}坂",
        last_name:       "#{n}押",
        first_kana_name: "#{n}サカ",
        last_kana_name:  "#{n}オシ",
        postal_code:     "#{n}#{n}#{n}#{n}#{n}#{n}#{n}",
        prefecture:      "#{n}都道府県",
        city_address:    "#{n}市区町村#{n}番地",
        building:        "#{n}マンション#{n}号",
        tel_number:      "#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}#{n}",
        email:           "#{n}@gmail.com",
        password:        "#{n}#{n}#{n}#{n}#{n}#{n}"
    )
end

Admin.create(email: "admin@gmail.com", password: 123456)

100.times do |n|
    Stock.create(
        item_id:       "#{n}",
        arrival_count: "#{n}",
        arrival_date:  '2019-10-20'
    )
end

100.times do |n|
    Disc.create(
        item_id:    "#{n}",
        disc_number: 1
    )
end

100.times do |n|
    Track.create(
        disc_id:      "#{n}",
        track_number: "#{n}",
        track_name:   "#{n}丁目のおじさん"
    )
end

100.times do |n|
    Address.create(
        user_id: "#{n}",
        first_name:      "#{n}坂",
        last_name:       "#{n}押",
        first_kana_name: "#{n}サカ",
        last_kana_name:  "#{n}オシ",
        postal_code:     "#{n}#{n}#{n}-#{n}#{n}#{n}#{n}",
        prefecture:      "#{n}都道府県",
        city_address:    "#{n}市区町村#{n}番地",
        building:        "#{n}マンション#{n}号"
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