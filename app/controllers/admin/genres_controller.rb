class Admin::GenresController < Admin::AdminApplicationsController
  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to new_admin_genre_path
    # TODO:バリデーションに伴うエラー表示やフラッシュメッセージが必要な場合は条件分岐などを追記
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to new_admin_genre_path
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
