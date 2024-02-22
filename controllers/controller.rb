get "/" do
  @boards = Board.all
  erb :homepage
end

get "/board/:name" do
    @board = Board.first(name:params[:name])
    @posts = Post.where(board_id:@board.id)
    erb :board
end

get "/create-post" do
    erb :create_post
end

post "/create-post" do
    post = Post.new
    post.board_id = 1 # change
    post.title = params["title"]
    post.body = params["body"]
    post.save_changes
    redirect "/"
end
