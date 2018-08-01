class User < ApplicationRecord
    validates :username, presence: true, 
    uniqueness: {case_sensitive: false},
    length: {minimum: 3, maximum: 25}

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { minimum: 0, maximum: 25}, 
    uniqueness: {case_sensitive: false},
    format: {with: VALID_EMAIL_REGEX, message: "Must be a valid email address!"}

end