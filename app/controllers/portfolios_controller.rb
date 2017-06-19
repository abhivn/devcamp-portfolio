class PortfoliosController < ApplicationController

  before_action :set_portfolio, only: [:edit, :destroy, :update, :show]
  layout "portfolio"

  def index
    # @portfolios = Portfolio.where(subtitle: "Ruby on rails")
    @portfolios = Portfolio.all()
  end

  def new
    @portfolio = Portfolio.new
    3.times {@portfolio.technologies.build}
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    3.times {@portfolio.technologies.build}
  end

  def show

  end

  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to portfolios_path
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end


  private
    def portfolio_params
     params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,technologies_attributes: [:name]
                                      )
    end

end
