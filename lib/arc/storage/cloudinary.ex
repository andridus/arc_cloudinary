defmodule Arc.Storage.Cloudinary do
  
  def put(definition, version, {file, scope}) do
    version
    destination_dir = definition.storage_dir(version, {file, scope})
    filename = Path.basename(file.file_name, Path.extname(file.file_name))
    Cloudex.upload(file.path, %{ public_id: filename })
  end

  def delete(definition, version, {file, scope}) do
    filename = Path.basename(file.file_name, Path.extname(file.file_name))
    Cloudex.delete(filename) |> IO.inspect
  end

  def url(definition, version, {file, scope}, options \\ []) do
    protocol = case options do
      [protocol: protocol] -> protocol
      _ -> "http"
    end 
    protocol<>":"<>Cloudex.Url.for(file.file_name, version)
  end

end