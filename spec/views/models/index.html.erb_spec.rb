require 'rails_helper'

RSpec.describe "models/index", type: :view do
  before(:each) do
    assign(:models, [
      Model.create!(
        Task: "Task",
        integer: "",
        string: "",
        string: ""
      ),
      Model.create!(
        Task: "Task",
        integer: "",
        string: "",
        string: ""
      )
    ])
  end

  it "renders a list of models" do
    render
    assert_select "tr>td", text: "Task".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
