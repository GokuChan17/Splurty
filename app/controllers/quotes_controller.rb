class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def new
    @quote = Quote.new
  end


  # The 'create' method sends saying and author parts to the database and saved
  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end
    redirect_to root_path
  end


  private

  # 'quote_params' pulls the values of 'saying' and 'author' from the quotes form
  def quote_params
    # this line of code is also make sure the form is secure and no evil hackers can inject anything else
    # only 'permit' "saying" and "author" into the database.
    params.require(:quote).permit(:saying, :author)
  end

end
