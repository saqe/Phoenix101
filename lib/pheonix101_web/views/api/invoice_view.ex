defmodule Pheonix101Web.InvoiceView do
  use Pheonix101Web, :view
  alias Pheonix101Web.InvoiceView

  def render("index.json", %{invoices: invoices}) do
    render_many(invoices, InvoiceView, "invoice.json")
  end

  def render("show.json", %{invoice: invoice}) do
    render_one(invoice, InvoiceView, "invoice.json")
  end

  def render("invoice.json", %{invoice: invoice}) do
    %{
      product_id: invoice.product_id,
      title: invoice.product.title,
      price: invoice.product.price,
      quantity: invoice.quantity,
      amount: (invoice.quantity * invoice.product.price) |> Float.ceil(2)
    }
  end
end
