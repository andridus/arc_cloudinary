defmodule ArcCloudinary.CloudexStart do
  use GenServer

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(_) do
    Cloudex.Settings.start(%{
      api_key: Application.get_env(:arc, :cloudinary_api_key),
      secret: Application.get_env(:arc, :cloudinary_secret),
      cloud_name: Application.get_env(:arc, :cloudinary_cloud_name)
    })
  end

end