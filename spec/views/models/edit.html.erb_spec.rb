require 'rails_helper'

RSpec.describe "models/edit", type: :view do
  before(:each) do
    @model = assign(:model, Model.create!(
      Task: "MyString",
      integer: "",
      string: "",
      string: ""
    ))
  end

  it "renders the edit model form" do
    render

    assert_select "form[action=?][method=?]", model_path(@model), "post" do

      assert_select "input[name=?]", "model[Task]"

      assert_select "input[name=?]", "model[integer]"

      assert_select "input[name=?]", "model[string]"

      assert_select "input[name=?]", "model[string]"
    end
  end
end
