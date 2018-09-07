require 'rails_helper'

describe Product do
  let(:product) {
    Product.create!(name: 'Erdbeere Kuchen')
  }

  let(:user) {
    User.create!(
      first_name: 'Blaeue',
      last_name: 'Baduan',
      email: 'babuni@ga.com',
      password: 123321)
  }

  before do
    product.comments.create!(rating: 1, user: user, body: 'Lecker!')
    product.comments.create!(rating: 3, user: user, body: "Ok!")
    product.comments.create!(rating: 5, user: user, body: "Perfekt!")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end
end