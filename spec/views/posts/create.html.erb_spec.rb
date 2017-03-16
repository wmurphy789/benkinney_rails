require 'rails_helper'

RSpec.describe "posts/create", type: :view do
  before(:each) do
    assign(:posts, [
      create(:post),
      create(:post)
    ])
  end
end