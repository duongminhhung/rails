class SampleJob < ApplicationJob
  queue_as :default

  def perform(post_params)
    title = post_params[:title]
    body = post_params[:body]
    user_id = post_params[:user_id]

    Post.create(title: title, body: body, user_id: user_id)
  end

end
