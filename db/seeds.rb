# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@email',
  password: '123456'
)

User.create!(
  [
    {email: 'mina@test.com', name: 'みな', password: 'password', message: nil, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg" )},
    {email: 'jann@test.com', name: 'jann', password: 'password', message: 'Love Ice!', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg" )},
    {email: 'alice@test.com', name: 'アリス', password: 'password', message: 'アイスをもとめて三千里！' }
  ]
)

Shop.create!(
  [
    {name: 'アイスショップ', address: '福岡県福岡市中央区', telepone: '0000-00-0000', open_time: 'Sat, 01 Jan 2000 09:00:00.000000000 UTC +00:00', close_time: 'Sat, 01 Jan 2000 17:00:00.000000000 UTC +00:00',
    off_day: '第3水曜日（祝日の場合は翌日）', website: 'website', latitude: 33.588913, longitude: 130.38539, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-shop1.jpg"), filename:"sample-shop1.jpg" ) },
    {name: 'シャーベット屋さん', address: '福岡県福岡市博多区', telepone: '0000-00-0000', open_time: 'Sat, 01 Jan 2000 09:00:00.000000000 UTC +00:00', close_time: 'Sat, 01 Jan 2000 17:00:00.000000000 UTC +00:00',
    off_day: '毎週木曜日', website: 'website', latitude: 33.590342, longitude: 130.441447, image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-shop2.jpg"), filename:"sample-shop2.jpg" ) }
  ]
)

Post.create!(
  [
    {user_id: 1, shop_id: 1, title: '新店舗オープン！', content: '天神に新しいアイスクリーム専門店がオープン！おしゃれでおいしい！', non_display: false,
    images: [ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg" ), ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-shop1.jpg"), filename:"sample-shop1.jpg" )] },
    {user_id: 2, shop_id: 2, title: 'アイス休憩', content: '犬のお散歩の途中でふらりと立ち寄り。アイス片手に公園で休憩', non_display: false }
  ]
)

Review.create!(
  [
    {user_id: 1, shop_id: 1, title: 'オープン初日', rate: 4.0, ice_name: 'アイス2種盛り', price: '800', feedback: 'オープン初日とあって、行列が！チョコとバニラ、両方おいしかったです', non_display: false },
    {user_id: 2, shop_id: 2, title: 'オレンジシャーベット', rate: 3.0, ice_name: 'オレンジシャーベット', price: '300', feedback: '天気のいい日に食べるシャーベット！オレンジの酸味が効いてます', non_display: false }
  ]
)

Comment.create!(
  [
    {user_id: 2, review_id: 1, comment: '自分も気になっていたんです！おいしそうですね' },
    {user_id: 3, review_id:1, comment: 'ほかにどんな味があるのか気になります' }
  ]
)

Tag.create!(
  [
    {tag_name: '福岡'},
    {tag_name: 'アイスクリーム'},
    {tag_name: '休憩'}
  ]
)

TagMap.create!(
  [
    {post_id: 1, tag_id: 1},
    {post_id: 1, tag_id: 2},
    {post_id: 2, tag_id: 3}
  ]
)