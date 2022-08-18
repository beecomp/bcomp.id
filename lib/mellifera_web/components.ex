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
end
