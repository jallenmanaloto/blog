require 'rails_helper'

describe Category, type: :model do
    let! (:category) { Category.new}

    context 'Validations' do
        it '1. Is not valid without a name' do
            category.name = nil

            expect(category).to_not be_valid
        end

        it '2. Name should be more than 3 characters' do
            category.name = "th"

            expect(category).to_not be_valid
        end

        it '3. Name should be unique' do
            Category.create!(:name=> 'unique')
            new_cat = Category.new(:name=> 'unique')

            expect(new_cat).to_not be_valid
        end
    end
end
