require 'rails_helper'

RSpec.describe "models/new", type: :view do
  before(:each) do
    assign(:model, Model.new(
      Task: "MyString",
      integer: "",
      string: "",
      string: ""
    ))
  end

  it "renders new model form" do
    render

    assert_select "form[action=?][method=?]", models_path, "post" do

      assert_select "input[name=?]", "model[Task]"

      assert_select "input[name=?]", "model[integer]"

      assert_select "input[name=?]", "model[string]"

      assert_select "input[name=?]", "model[string]"
    end
  end
end
