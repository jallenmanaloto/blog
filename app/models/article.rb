class Article < ApplicationRecord
    validates :name, presence: true,
                    uniqueness: true
    validates :body, presence: true,
                    length: { minimum: 0, maximum: 100 }

    has_many :comments
end
