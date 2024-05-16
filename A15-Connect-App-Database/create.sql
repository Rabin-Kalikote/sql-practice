DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Opinions;
DROP TABLE IF EXISTS Comments;
DROP TABLE IF EXISTS Relationships;
DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS Votes;

CREATE TABLE `Users` (
  `id` INTEGER,
  `email` VARCHAR(25),
  `name` VARCHAR(15),
  `about` VARCHAR(2500),
  `phone` VARCHAR(14),
  `encrypted_password` VARCHAR(255),
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`)
);

CREATE TABLE `Opinions` (
  `id` INTEGER NOT NULL,
  `body` VARCHAR(2500),
  `user_id` INTEGER NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Comments` (
  `id` INTEGER NOT NULL,
  `body` VARCHAR(2500),
  `user_id` INTEGER NOT NULL,
  `opinion_id` INTEGER NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`opinion_id`) REFERENCES `Opinions`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE CASCADE
);

CREATE TABLE `Relationships` (
  `follower_id` INTEGER NOT NULL,
  `followed_id` INTEGER NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`follower_id`, `followed_id`),
  FOREIGN KEY (`followed_id`) REFERENCES `Users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`follower_id`) REFERENCES `Users`(`id`) ON DELETE CASCADE,
  UNIQUE(`follower_id`, `followed_id`),
  CHECK (follower_id <> followed_id)
);

CREATE TABLE `Messages` (
  `id` INTEGER NOT NULL,
  `body` VARCHAR(2500),
  `sender_id` INTEGER NOT NULL,
  `receiver_id` INTEGER NOT NULL,
  `status` VARCHAR(14) CHECK (status IN ('seen', 'unseen')) NOT NULL DEFAULT 'unseen',
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`receiver_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY (`sender_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE `Votes` (
  `id` INTEGER NOT NULL,
  `type` VARCHAR(8) CHECK (type IN ('Upvote', 'Downvote')) NOT NULL,
  `user_id` INTEGER NOT NULL,
  `opinion_id` INTEGER NOT NULL,
  `created_at` DATETIME,
  `updated_at` DATETIME,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`opinion_id`) REFERENCES `Opinions`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `Users`(`id`) ON DELETE CASCADE,
  UNIQUE(`user_id`, `opinion_id`)
);


INSERT INTO Users(id, email, name, about, phone, encrypted_password, created_at, updated_at)
VALUES
    (1, 'rab@gmail.com', 'Rabin Kalikote', 'Hero', '9868375352','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (2,'him@gmail.com', 'Himal Rimal', 'Manly', '2084545454', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (3,'james@gmail.com', 'James Shrestha', 'Singer', '1234567890', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (4,'beast@gmail.com', 'Mr Beast', 'Rich', '986837546312', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (5, 'anonymous@gmail.com', 'Anonymous Man', 'Secret', '9868375352','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (6,'badboy@gmail.com', 'Subha Singh', 'Handsome', '2084545454', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (7,'doc@gmail.com', 'Doctor Shrestha', 'Passionate', '1234567890', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now')),
    (8,'coderpradip@gmail.com', 'Pradip Adhikari', 'Gamer', '986837546312', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a', DateTime('now'), DateTime('now'));
    
INSERT INTO Relationships(follower_id, followed_id, created_at, updated_at)
VALUES
    (1, 2, DateTime('now'), DateTime('now')),  
    (1, 3, DateTime('now'), DateTime('now')), 
    (1, 4, DateTime('now'), DateTime('now')), 
    (1, 7, DateTime('now'), DateTime('now')), 
    (2, 1, DateTime('now'), DateTime('now')), 
    (3, 1, DateTime('now'), DateTime('now')), 
    (8, 1, DateTime('now'), DateTime('now')), 
    (8, 6, DateTime('now'), DateTime('now'));
    
    
INSERT INTO Opinions(id, body, user_id, created_at, updated_at)
VALUES
    (1, 'I believe that chocolate ice cream is the best flavor because it has a rich, deep taste that satisfies my sweet tooth better than any other flavor. The combination of creamy texture and intense chocolate makes it unbeatable.', 1, DateTime('now'), DateTime('now')), 
    (2, 'In my opinion, summer is the best season of the year because of the long days and warm weather. It’s the perfect time for outdoor activities like swimming, hiking, and barbecues with friends and family. Plus, the vibrant greenery and blooming flowers create a beautiful environment.', 1, DateTime('now'), DateTime('now')),
    (3, 'I think that online learning is more effective than traditional classroom education because it allows for a flexible schedule and personalized learning pace. Students can access a wider range of resources and engage in interactive, multimedia-rich content that can enhance understanding and retention of material.', 2, DateTime('now'), DateTime('now')),
    (4, 'Cats make better pets than dogs because they are more independent and low-maintenance. They don’t require constant attention or daily walks, and they are generally quieter. Cats are also known for their cleanliness and ability to entertain themselves, which makes them ideal for people with busy lifestyles.', 7, DateTime('now'), DateTime('now')),
    (5, 'The book was far more engaging than the movie adaptation because it allowed for a deeper exploration of the characters’ thoughts and emotions. The detailed descriptions and inner monologues provided a richer, more immersive experience that the movie couldn’t capture in a limited runtime.', 6, DateTime('now'), DateTime('now')),
    (6, 'I feel that public transportation should be free for everyone because it would encourage more people to use it, reducing traffic congestion and environmental pollution. Free public transport would also make commuting more accessible for low-income individuals, promoting social equity and economic mobility.', 4, DateTime('now'), DateTime('now')),
    (7, 'Home-cooked meals are healthier and tastier than restaurant food because you have control over the ingredients and cooking methods. Cooking at home allows you to use fresh, high-quality ingredients and avoid excessive use of salt, sugar, and unhealthy fats that are often found in restaurant dishes.', 3, DateTime('now'), DateTime('now'));
    
    
INSERT INTO Comments(id, body, user_id, opinion_id, created_at, updated_at)
VALUES
    (1, 'Chocolate ice cream does have a universally loved appeal due to its rich and indulgent flavor. However, some might argue that vanilla ice cream is the best because of its versatility and ability to pair well with a variety of toppings and desserts.', 1, 1, DateTime('now'), DateTime('now')), 
    (2, 'While chocolate ice cream is undeniably delicious, many people enjoy experimenting with more adventurous and unique flavors like salted caramel or matcha green tea, which offer new and exciting taste experiences.', 7, 1, DateTime('now'), DateTime('now')),
    (3, 'Summer does offer many enjoyable activities and beautiful scenery, but some might argue that autumn, with its crisp air and colorful foliage, provides a more comfortable and visually stunning experience.', 1, 2, DateTime('now'), DateTime('now')),
    (4, 'Online learning has many benefits, but it can also lack the personal interaction and immediate feedback that traditional classrooms provide, which are important for many students learning processes.', 3, 3, DateTime('now'), DateTime('now')),
    (5, 'While cats are indeed independent, dog lovers might argue that the companionship, loyalty, and active lifestyle that dogs offer are invaluable, and many find the daily walks and playtime to be rewarding and enjoyable.', 7, 4, DateTime('now'), DateTime('now')),
    (6, 'Books often provide more depth, but movies can bring stories to life with visual effects, music, and performances that can add new dimensions to the narrative, making the experience more dynamic for some viewers.', 8, 5, DateTime('now'), DateTime('now'));
    
    
INSERT INTO Votes(id, type, user_id, opinion_id, created_at, updated_at)
VALUES
    (1, 'Upvote', 1, 2, DateTime('now'), DateTime('now')),  
    (2, 'Downvote', 1, 1, DateTime('now'), DateTime('now')),
    (3, 'Upvote', 1, 3, DateTime('now'), DateTime('now')),
    (4, 'Upvote', 2, 2, DateTime('now'), DateTime('now')),
    (5, 'Upvote', 3, 1, DateTime('now'), DateTime('now')),
    (6, 'Upvote', 7, 4, DateTime('now'), DateTime('now')),
    (7, 'Upvote', 3, 4, DateTime('now'), DateTime('now')),
    (8, 'Downvote', 2, 3, DateTime('now'), DateTime('now')),
    (9, 'Downvote', 2, 4, DateTime('now'), DateTime('now')),
    (10, 'Downvote', 1, 5, DateTime('now'), DateTime('now')),
    (11, 'Upvote', 1, 4, DateTime('now'), DateTime('now')),
    (12, 'Upvote', 8, 2, DateTime('now'), DateTime('now')),
    (13, 'Downvote', 4, 2, DateTime('now'), DateTime('now')),
    (14, 'Downvote', 7, 5, DateTime('now'), DateTime('now')),
    (15, 'Upvote', 4, 4, DateTime('now'), DateTime('now'));
    
    
INSERT INTO Messages(id, body, sender_id, receiver_id, status, created_at, updated_at)
VALUES
    (1, 'I’ve decided to get into shape. I’m going to start jogging.', 1, 2, 'seen', DateTime('now'), DateTime('now')),
    (2, 'Really? You’ve decided to run?', 2, 1, 'seen', DateTime('now'), DateTime('now')),
    (3, 'Yep! I even bought new running shoes.', 1, 2, 'seen', DateTime('now'), DateTime('now')),
    (4, 'Well, at least your shoes will be getting a workout!', 2, 1, 'seen', DateTime('now'), DateTime('now')),
    (5, 'Hey, I’m serious this time!', 1, 2, 'unseen', DateTime('now'), DateTime('now')),
    (6, 'Can you give me 1 million dollars?', 1, 4, 'unseen', DateTime('now'), DateTime('now')),
    (7, 'I am attacking this app at 5pm. Save if you can....', 5, 8, 'seen', DateTime('now'), DateTime('now'));
    
    
    
    
    

