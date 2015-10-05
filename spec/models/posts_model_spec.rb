require 'rspec'
require '../../app/models/post'

RSpec.describe Post, :type => :model do
  it "orders by title" do
    lindeman = Post.create!(title: "ppp", content: "aaa")
    chelimsky = Post.create!(first_name: "fff", last_name: "zzz")

    expect(Post.ordered_by_title).to eq([chelimsky, lindeman])
  end
end