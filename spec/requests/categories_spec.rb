 require 'rails_helper'

describe "/categories", type: :request do

  describe "get /index" do
    it "shows the index page" do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end

  describe "get /new" do
    it "shows the create new category page" do
      # category = Category.create!(:name=> "sample category")

      get new_category_path
      expect(response).to have_http_status(200)
    end
  end

  # describe "creating and saving new category" do
  #   it "creates new category and adds to existing count" do
        # post and save new category
  #   end
  # end

  describe "get /show" do
    it "renders the category based on id" do
      category = Category.create!(:name=> "Theme")

      get "/categories/#{category.id}"
      expect(response).to have_http_status(200)
    end
  end

  describe "PATCH" do
    context "with valid parameters" do

      it "updates the requested category and redirects" do
        category = Category.create!(:name => "Theme")
        patch category_url(category), params:{ category: { name: "new theme" } }

        expect(category.name) == "new theme"
        expect(response).to be_redirect
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category and increase Category count by 1" do
        expect {
          post categories_url, params: { category: { name: "new theme" } }
        }.to change(Category, :count).by(+1)
          # expect(response).to have_http_status(:created)
      end

      it "redirects to the created category" do
        post categories_url, params: { category: { name: "new theme" } }
        expect(response).to redirect_to(category_url(Category.last))
      end
    end
 

    context "with invalid parameters" do
      it "does not create a new Category" do
        expect {
          post categories_url, params: { category: {name: nil} }
        }.to change(Category, :count).by(0)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      category = Category.create!(:name=> "To be deleted")
      expect {
        delete category_url(category)
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create!(:name=> "To be deleted")
      delete category_url(category)
      expect(response).to redirect_to(categories_url)
    end
  end
end
