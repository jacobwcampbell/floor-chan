get "/" do
  @boards = Board.all
  erb :homepage
end
