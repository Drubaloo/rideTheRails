class CommentController < ApplicationController
  def index
    belongs_to :user
    belongs_to :commentable, polymorphic: true

    validates :body, presence: true
  end
end
