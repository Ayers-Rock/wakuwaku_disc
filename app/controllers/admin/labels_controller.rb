class Admin::LabelsController < Admin::AdminApplicationsController
  def new
    @label = Label.new
    @labels = Label.all
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to new_admin_label_path
    else
      @labels = Label.all
      render :new
    end
  end

  def destroy
    label = Label.find(params[:id])
    label.destroy
    redirect_to new_admin_label_path
  end

  private
  def label_params
    params.require(:label).permit(:label_name)
  end
end
