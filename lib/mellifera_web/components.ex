defmodule MelliferaWeb.Components do
  use Phoenix.Component

  import MelliferaWeb.ComponentView

  def index_hero(assigns) do
    render("index_hero.html", assigns)
  end

  def header(assigns) do
    render("header.html", assigns)
  end

  def navbar(assigns) do
    render("navbar.html", assigns)
  end

  def mobile_navbar(assigns) do
    render("mobile_navbar.html", assigns)
  end

  def mobile_menu(assigns) do
    render("mobile_menu.html", assigns)
  end

  def prizes(assigns) do
    render("prizes.html", assigns)
  end

  def about_us(assigns) do
    render("about_us.html", assigns)
  end

  def faq(assigns) do
    render("faq.html", assigns)
  end

  def faq_box(assigns) do
    render("faq_box.html", assigns)
  end

  def how_to_join(assigns) do
    render("how_to_join.html", assigns)
  end

  def schedule(assigns) do
    render("schedule.html", assigns)
  end

  def footer(assigns) do
    render("footer.html", assigns)
  end
end
