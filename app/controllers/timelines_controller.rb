class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:edit, :update, :destroy]
  def index
    @timelines = Timeline.all
    @timelines = Kaminari.paginate_array(@timelines).page(params[:page]).per(20)
  end

  def list
    @timelines = Timeline.all
    @timelines = Kaminari.paginate_array(@timelines).page(params[:page]).per(10)
  end

  def new
    @timeline = Timeline.new
  end

  def create
    @timeline = Timeline.new(timeline_params)
    if @timeline.save
      redirect_to timelines_path, notice: 'Created memory successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @timeline.update_attributes(timeline_params)
      redirect_to timelines_path, notice: 'Updated memory successfully.'
    else
      render :edit
    end
  end

  def destroy
    @timeline.remove_picture!
    @timeline.destroy
    redirect_to timelines_path, alert: 'Deleted memory successfully.'
  end

  private
    def timeline_params
      params.require(:timeline).permit(:date, :name_of_date, :description, :picture)
    end

    def set_timeline
      @timeline = Timeline.find(params[:id])
    end
end
