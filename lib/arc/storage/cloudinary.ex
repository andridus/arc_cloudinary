defmodule Arc.Storage.Cloudinary do
  
  def put(definition, version, {file, scope}) do
    version
    destination_dir = definition.storage_dir(version, {file, scope})
    full_path = Path.join(destination_dir, file.file_name)

    [ok: uploaded_file] = Cloudex.upload(file.path, %{ public_id: file.file_name })
    
    {:ok, uploaded_file}
  end

  def url(definition, version, {file, scope}, options \\ []) do
    Cloudex.Url.for(file.file_name, transform(version))
  end

  defp transform(version) do
    IO.inspect version
    %{width: 400, height: 300}
  end

end