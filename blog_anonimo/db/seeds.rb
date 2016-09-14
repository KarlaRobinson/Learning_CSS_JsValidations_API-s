post1 = Post.create(title: "BestFriend", body: "Eating chocolate with my bestie!")
post2 = Post.create(title: "RainySunday", body: "Wishing the rain would stop so I can take my dog for a walk.")
post3 = Post.create(title: "Incomplete")


post1.tags << Tag.create(text: "BestFriendsLove")
post1.tags << Tag.create(text: "SugarOverdose")