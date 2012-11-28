class HomeController < ApplicationController
  # Index page for the website
  def index
    if user_signed_in?
      render
    else
      render action: 'index_not_signed_in'
    end
  end

  # Process a text file delimited by tabs
  def process_file
    # Check user input
    if params[:text_file].blank?
      redirect_to root_path, alert: "You need to submit a text file to process" and return
    end

    # Process the file
    begin
      require 'csv'
      data = CSV.parse(params[:text_file].read, {headers: true, col_sep: "\t", skip_blanks: true})
      data.each do |row|
        process_text_row(row)
      end
    rescue Exception => e
      redirect_to root_path, alert: "There was an issue processing the file: #{e.message}" and return
    end

    # Everything went fine
    flash.now[:notice] = "File processed, you can check the results by navigating the website"

    render action: :index
  end

  private

  # Process each row of a text file
  def process_text_row(row)
    # Find or create the merchant
    if Merchant.where(name: row[5]).exists?
      merchant = Merchant.where(name: row[5]).first
    else
      merchant = Merchant.create!(name: row[5], address: row[4])
    end

    # Find or create the product
    if merchant.products.where(description: row[1]).exists?
      product = Product.where(description: row[1]).first
    else
      product = merchant.products.create!(description: row[1], price: row[2])
    end

    # Create the sale unless it exists
    unless Sale.where(purchaser: row[0], merchant: merchant, product: product).exists?
      Sale.create!(purchaser: row[0], quantity: row[3], merchant: merchant, product: product)
    end

  end

end
