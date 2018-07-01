class User < ApplicationRecord
  has_many :posts
  has_many :comments
  #  id                   :integer          not null, primary key
  #  name                 :string(50)       default("")
end

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  #  id                   :integer          not null, primary key
  #  user_id              :integer
  #  content              :text             default("")
  #  created_at           :datetime
end


class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #  id                   :integer          not null, primary key
  #  user_id              :integer
  #  post_id              :integer
  #  content              :text             default("")
  #  created_at           :datetime
end

class NewsfeedController < ApplicationController
  # JSON endpoint that returns an array of Post objects in order of
  # newest first, to oldest last. Each Post contains a User object
  # (the author of the Post), and an array of Comments. Each Comment
  # will also include the User object of the Comment's author.
  
  # TODO: Newsfeed endpoint here
end

# Response Format

[
  {
    "type": "Post",
    "content": "First post",
    "user": {
      "type": "User",
      "name": "Luke"
    },
    "comments": [
      {
        "type": "Comment",
        "user": {
          "type": "User",
          "name": "Leia"
        },
        "content": "First comment"
      },
      {
        "type": "Comment",
        "user": {
          "type": "User",
          "name": "Han"
        },
        "content": "Second comment"
      },
    ]
  },
  {
    "type": "Post",
    "content": "Second post",
    "user": {
      "type": "User",
      "name": "Darth Vader"
    },
    "comments": [
      {
        "type": "Comment",
        "user": {
          "type": "User",
          "name": "Boba Fett"
        },
        "content": "Third comment"
      },
      {
        "type": "Comment",
        "user": {
          "type": "User",
          "name": "Jabba"
        },
        "content": "Fourth comment"
      },
    ]
  }
]
