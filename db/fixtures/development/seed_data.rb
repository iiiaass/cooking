customers = Customer.create!(
  [
    {email: 'mutuki@test.com', last_name: 'mutuki', first_name: "mutuki", password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/development/japan.jpg"), filename:"sample-user1.jpg")},
    {email: 'kisaragi@test.com', last_name: 'kisaragi',first_name: "kisaragi", password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/development/japan2.jpg"), filename:"sample-user2.jpg")},
    {email: 'yayoi@test.com', last_name: 'yayoi',first_name: "yayoi", password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/development/snow.jpg"), filename:"sample-user3.jpg")}
  ]
)

genres = Genre.create!(
  [
    {name: "和食"},
    {name: "洋食"},
    {name: "イタリアン"}
  ]
)

post_contents = [
  { title: '肉じゃが', article: 'test100'},
  { title: 'カレー', article: 'test200'},
  { title: 'にら玉', article: 'test300'},
  { title: 'パスタ', article: 'test100'},
  { title: 'ドリア', article: 'test200'},
  { title: '簡単なブッシュドノエル', article: 'test300'},
  { title: 'パスタ', article: 'test100'},
  { title: 'ドリア', article: 'test200'},
  { title: '簡単なブッシュドノエル', article: 'test300'},

]
# post = Post.new(
#       customer_id: customers[0].id,
#       genre_id: genres[0].id,
#       title: post_contents[0][:title],
#       article: post_contents[0][:article]
#     )
#     3.times do |i|
#       post.images.attach(
#       io: File.open("#{Rails.root}/db/fixtures/development/post_sample#{i + 1}.jpg"),
#       filename:"post_sample#{i + 1}.jpg"
#     )
#     post.save!
#   end


post_content_num = 0

customers.each_with_index do |customer, customer_i|
  genres.each_with_index do |genre, genre_i|
    post = Post.new(
      customer_id: customers[customer_i].id,
      genre_id: genres[genre_i].id,
      title: post_contents[post_content_num][:title],
      article: post_contents[post_content_num][:article]
    )
    3.times do |i|
      post.images.attach(
      io: File.open("#{Rails.root}/db/fixtures/development/post_sample#{i + 1}.jpg"),
      filename:"post_sample#{i + 1}.jpg"
    )
    end
    post.save!
    post_content_num += 1

  end
end

genres = Genre.create!(
  [
    {name: "フレンチ"},
    {name: "和菓子"},
    {name: "洋菓子"}
  ]
)

posts = Post.all
nices = Nice.create!(
  [
    {customer_id: customers[0].id,post_id: posts[0].id},
    {customer_id: customers[2].id,post_id: posts[1].id}
  ]
  )

relationships = Relationship.create!(
  [
    {follower_id: customers[0].id,followed_id: customers[1].id}
  ]
  )

comments = Comment.create!(
  [
    {customer_id: customers[0].id,post_id: posts[1].id,body: "コメントしました"}
    ]
    )


