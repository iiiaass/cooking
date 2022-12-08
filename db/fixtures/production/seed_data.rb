customers = Customer.create!(
  [
    {email: 'mutuki@test.com', last_name: '睦月', first_name: "一花", password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/images/japan.jpg"), filename:"sample-user1.jpg"),introduction: "わかりやすくレシピを書くことを意識しています！何かあれば、コメントよろしくおねがいします！"},
    {email: 'kisaragi@test.com', last_name: '如月',first_name: "二葉", password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/images/japan2.jpg"), filename:"sample-user2.jpg"),introduction: "普段料理したもので美味しかったら、メモも兼ねて投稿しています。よろしくお願いします！"},
    {email: 'yayoi@test.com', last_name: '弥生',first_name: "美香", password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/images/snow.jpg"), filename:"sample-user3.jpg"),introduction: "最近自炊を始めてみました。よろしくお願いします！"}
  ]
)

genres = Genre.create!(
  [
    {name: "お肉のおかず"},
    {name: "魚介のおかず"},
    {name: "ご飯もの"}
  ]
)

post_contents = [
  { title: '肉じゃが', article: '1
じゃがいもは3cmくらいの乱切りにして、さっと洗う

2
にんじんは3-4mmくらいの厚さ、玉ねぎは6-7mmくらいの厚さで半月切りにする

3
砂糖、しょうゆ、水を合わせて、鍋で一煮立ちする

4
煮汁に豚こまと玉ねぎを入れて煮る

5
水気を切ったじゃがいもとにんじんを入れて、落とし蓋をして、柔らかくなるまで煮る'},
  { title: 'カレイの煮つけ', article: '1
フライパンに調味料全てを入れ、沸騰させます。
沸騰するまでの間に、カラスカレイをさっと水洗いします。

2
沸騰したら、カレイを入れて、落し蓋をします。
弱火で10分くらいで完成です！

コツ・ポイント
味を染み込ませるため、完成したものを一度冷まして、食べるときに再び軽めに温めることをオススメします!'},
  { title: '牛すじカレー', article: '1
牛すじ肉の下処理をする
豚肉の場合この工程を飛ばしてください！

2
野菜、牛すじ肉は一口大に切る。

3
鍋にサラダ油を入れ、中火で玉ねぎを炒める。

4
全体に油をまとってきたら、ニンジンを加える。

5
玉ねぎがキツネ色になってきたら、じゃがいもを入れる。

6
続けて、下処理した牛すじ肉を入れる。

7
焦がさないように注意しながら５分程炒めたら、水と牛すじダシ汁を入れる。

8
沸騰したら弱火にし、カレールウを溶かし、さらに２０分程煮込む。

9
お皿に盛り付けて完成です。'},
  { title: '豚肉とニラ、エノキの簡単巻き', article: '1
できたら豚肉を調理15分前くらいに出しておく。お肉は広げて、包丁で軽く叩きつける。切れない程度に。

2
ニラはお肉でまくと少しはみ出るくらいの幅に切っておく。6センチくらいお肉の幅に合わせてください

3
お肉を広げて、エノキとエリンギを巻く。あれば片栗粉をまぶす。
私は面倒なので、まぶしません。

4
調味料を混ぜておく。

5
フライパンにごま油を入れて、フライパンが温まったら、調味料を入れる。
中火。

6
両面が焼けてきたら、を調味料を入れる。
火加減を弱火にして、全体に味が染み込んだら完成。'},
  { title: '赤魚の煮つけ', article: '1
赤魚にお玉で熱湯をやさしくかける。

2
調味料を順番にフライパン又は底の浅い鍋に煮立たせる。

3
赤魚をそのまま又は半分に切って入れる。

4
落とし蓋（アルミホイルをくしゃくしゃにして、真ん中に穴を開けたものでも可）をして、弱めの中火で10分くらい煮る。

5
落とし蓋を取って、時々煮汁をかけながら、少し煮詰めていく。
出来上がり。

コツ・ポイント
•冷凍赤魚にお湯をかけるときは、お玉を使って、優しくかけてあげてください。'},
  { title: '和風カレー', article: '大根1/2本
にんじん1/2本
長ネギ１本
椎茸大３個
豚肉300g
和風出汁のもと大さじ１
めんつゆ大さじ１
カレールウ１箱

二枚目の写真は大根なし、しめじで
三枚目の写真は、大根ではなくジャガイモでつくりました！

1
根菜は皮を剥いて、１センチ角に切り揃える

2
切った野菜からどんどんゆでていきます

3
肉、しいたけ、ネギも同じようにどんどんゆでていき、和風だしのもと、めんつゆを入れて…

実はこのままでも美味しいです

4
大根に、火が通ったらカレーのルゥを溶かしこんでいきます

あとは、火を止めて味を染み込ませていく

5
食べるときにまた温め直して、お召し上がりください

コツ・ポイント
食材の形をそろえることで、いい感じになります'},
  { title: 'スタミナニラ玉のレシピ', article: '1
ニラと豚バラ肉を
3cm幅に切ります

2
フライパンを熱しごま油を入れて炒り卵を作ります

一度皿へうつします

3
先程のフライパンに再度ごま油を入れ豚バラ肉を炒めます

4
豚バラに火が通ったらニラを加えてさらに炒めます

5
調味料を入れてよく混ぜます

6
皿へうつした炒り卵をフライパンへ戻し混ぜ合わせたら
完成です

コツ・ポイント
炒り卵の火の通り加減はお好みで ◎'},
  { title: '簡単煮つけのレシピ', article: '1
赤魚にお玉で熱湯をやさしくかける。

2
調味料を順番にフライパン又は底の浅い鍋に煮立たせる。

3
赤魚をそのまま又は半分に切って入れる。

4
落とし蓋（アルミホイルをくしゃくしゃにして、真ん中に穴を開けたものでも可）をして、弱めの中火で10分くらい煮る。

5
落とし蓋を取って、時々煮汁をかけながら、少し煮詰めていく。
出来上がり。

コツ・ポイント
•冷凍赤魚にお湯をかけるときは、お玉を使って、優しくかけてあげてください。'},
  { title: 'じゃがいもと鶏肉の炒め物', article: '1
じゃがいもは皮を剥き、3mm程度の厚さに切る。鳥もも肉は大き目の一口大に切る。

2
鳥もも肉を耐熱容器に移し、塩で下味を付けたらラップをして3分加熱する。梅は包丁でたたき、調味料と合わせておく。

3
フライパンにオリーブオイルを引き、じゃがいもを焼く。片目に焼き目が付いたら裏返して反対面も同様に焼き目をつける。

4
鳥もも肉を加え、馴染ませる。調味料に鳥もも肉を加熱したときに出た肉汁を大さじ2程度加える。

5
調味料をフライパンに加え、全体が馴染んだら器に盛り付けて完成。

コツ・ポイント
じゃがいもはしっかり焼き目を付けると、タレと絡んで美味しいです。'},

]



post_content_num = 0
pic_num = 1

customers.each_with_index do |customer, customer_i|
  genres.each_with_index do |genre, genre_i|
    post = Post.new(
      customer_id: customers[customer_i].id,
      genre_id: genres[genre_i].id,
      title: post_contents[post_content_num][:title],
      article: post_contents[post_content_num][:article]
    )
    3.times do
      post.images.attach(
        io: File.open("#{Rails.root}/db/fixtures/images/image#{pic_num}.jpg"),
        filename:"image#{pic_num}.jpg"
        )
      pic_num += 1
    end
    post.save!
    post_content_num += 1
  end
end


genres = Genre.create!(
  [
    {name: "野菜のおかず"},
    {name: "汁物"},
    {name: "パン"},
    {name: "お菓子"},

  ]
)

  posts = Post.all
  nices = Nice.create!(
  [
    {customer_id: customers[0].id,post_id: posts[0].id},
    {customer_id: customers[0].id,post_id: posts[4].id},
    {customer_id: customers[0].id,post_id: posts[8].id},
    {customer_id: customers[1].id,post_id: posts[1].id},
    {customer_id: customers[1].id,post_id: posts[7].id},
    {customer_id: customers[2].id,post_id: posts[2].id},
    {customer_id: customers[2].id,post_id: posts[8].id},
    {customer_id: customers[2].id,post_id: posts[1].id}
  ]
  )

  relationships = Relationship.create!(
  [
    {follower_id: customers[0].id,followed_id: customers[1].id},
    {follower_id: customers[1].id,followed_id: customers[0].id},
    {follower_id: customers[1].id,followed_id: customers[2].id},
    {follower_id: customers[2].id,followed_id: customers[0].id}
  ]
  )

comments = Comment.create!(
  [
    {customer_id: customers[0].id,post_id: posts[1].id,body: "レシピについて聞きたいことがあればコメントよろしくお願いします！"},
    {customer_id: customers[0].id,post_id: posts[2].id,body: "レシピについて聞きたいことがあればコメントよろしくお願いします！"},
    {customer_id: customers[0].id,post_id: posts[5].id,body: "おいしく作れました！"},
    {customer_id: customers[1].id,post_id: posts[5].id,body: "レシピについて聞きたいことがあればコメントよろしくお願いします！"},
    {customer_id: customers[1].id,post_id: posts[2].id,body: "豚肉でつくってみました！おすすめです！"},
    {customer_id: customers[1].id,post_id: posts[6].id,body: "ニンニクを多めに入れてみました！おいしかったです"}
    ]
    )

Admin.create!(
  [
    {email: 'admin@test.com',password: 'password'}
    ]
    )

