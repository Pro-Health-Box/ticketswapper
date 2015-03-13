class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
  end

  def index
    @tickets = Ticket.all.paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash[:success] = 'Succesfully added your listing!'
      redirect_to @ticket
    else
      render 'new'
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    ticket = Ticket.find(params[:id])

    if ticket.update_attributes(ticket_params)
      flash[:success] = 'Listing Updated'
      redirect_to ticket
    else
      render 'edit'
    end
  end

  private

  def ticket_params 
    params.require(:ticket).permit(:event, :date, :quantity, :location, :description, :email)
  end
end
