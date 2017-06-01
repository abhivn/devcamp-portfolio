class PortfoliosController < ApplicationController

  before_action :set_portfolio, only: [:edit, :destroy, :update, :show]

  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(params.require(:portfolio).permit(:title,:subtitle,:body))
    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit

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

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end


  private
    def portfolio_params
     params.require(:portfolio).permit(:title,:subtitle,:body)
    end

end
