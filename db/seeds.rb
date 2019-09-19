user1 = User.create(name: "Joe", email: "joe@gmail.com",  password: "1111" )
user2 = User.create(name: "Anna", email: "anna@gmail.com",  password: "1111" )
user3 = User.create(name: "Dylan", email: "dylan@gmail.com",  password: "1111" )

supportItem1 = SupportItem.create(category: "practical", description: "car rides", frequency_num: 2, frequency_period: "week", user_id: 1)
supportItem2 = SupportItem.create(category: "emotional support", description: "phone calls", frequency_num: 1, frequency_period: "week", user_id: 2)
supportItem3 = SupportItem.create(category: "practical", description: "use my kitchen", frequency_num: 3, frequency_period: "month", user_id: 3)
