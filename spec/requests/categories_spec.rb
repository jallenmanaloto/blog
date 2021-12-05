 require 'rails_helper'

describe "/categories", type: :request do

  # Test to get the root page of Category with successful response
  describe "get /index" do
    # before do
    #   sign_in create(:user)
    # end

    it "shows the index page" do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end

  # Test to request show of creating new category page
  describe "get /new" do
    it "shows the create new category page" do
      get new_category_path

      expect(response).to have_http_status(200)
    end
  end

  # Test to show the page of a category based on id
  describe "get /show" do
    it "renders the category based on id" do
      category = Category.create!(:name=> "Theme")
      get "/categories/#{category.id}"

      expect(response).to have_http_status(200)
    end
  end

  # Test to update the category and redirects after
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

  # Test on creating or posting new category
  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category and increase Category count by 1" do

        expect {
          post categories_url, params: { category: { name: "new theme" } }
        }.to change(Category, :count).by(+1)
      end

      it "redirects to the created category" do
        post categories_url, params: { category: { name: "new theme" } }

        expect(response).to redirect_to(category_url(Category.last))
      end
    end
 
    # Considering invalid input of nil
    context "with invalid parameters" do
      it "does not create a new Category" do
        expect {
          post categories_url, params: { category: {name: nil} }
        }.to change(Category, :count).by(0)
      end
    end
  end

  #Test on deleting the category -> decreasing number of Category count
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
