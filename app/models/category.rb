class Category < ApplicationRecord
    validates :name, presence: true,
        uniqueness: true,
        length: { minimum: 3, maximum: 100 }

        has_many :tasks
end
