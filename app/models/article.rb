class Article < ApplicationRecord
    belongs_to :user
    before_save {self.email = email.downcase}
    validates :title, presence: true, length: {minimum: 5, maximum: 20}
    validates :description, presence: true, length: {minimum: 10, maximum: 500}
    validates :user_id, presence: true
end 