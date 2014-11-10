require 'rails_helper'

describe Comment do

  it "makes a comment for a user" do
    user_one = create_user
    user_two = create_different_user
    comment = Comment.create(
      user_id: user_one.id,
      commentable_id: user_two.id,
      commentable_type: "User",
      comment: "comment"
    )
    expect(comment).to be_valid
    expect(comment.commentable).to eq(user_two)
  end


end