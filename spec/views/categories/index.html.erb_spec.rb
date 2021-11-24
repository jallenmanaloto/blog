require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(:name=> "New category"),
      Category.create!(:name=> "Another category")
    ])
  end

  it "renders a list of categories" do
    render
  end
end
