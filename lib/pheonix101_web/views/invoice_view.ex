defmodule Pheonix101Web.InvoiceView do
  use Pheonix101Web, :view
  alias Pheonix101Web.InvoiceView

  def render("index.json", %{invoices: invoices}) do
    %{data: render_many(invoices, InvoiceView, "invoice.json")}
  end

  def render("show.json", %{invoice: invoice}) do
    %{data: render_one(invoice, InvoiceView, "invoice.json")}
  end

  def render("invoice.json", %{invoice: invoice}) do
    %{id: invoice.id, quantity: invoice.quantity, price: invoice.price}
  end
end
