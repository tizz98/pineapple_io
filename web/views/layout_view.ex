defmodule PineappleIo.LayoutView do
  use PineappleIo.Web, :view

  def is_login_path?(conn, method) do
    current_path = Path.join(["/" | conn.path_info])
    cond do
      session_path(conn, method) == current_path -> true
      true -> false
    end
  end

  def is_register_path?(conn, method) do
    current_path = Path.join(["/" | conn.path_info])
    cond do
      registration_path(conn, method) == current_path -> true
      true -> false
    end
  end
end
