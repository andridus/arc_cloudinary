defmodule Arc.Storage.Cloudinary do
  
  def put(definition, version, {file, scope}) do
    version
    destination_dir = definition.storage_dir(version, {file, scope})
    filename = Path.basename(file.filename, Path.extname(file.filename))
    Cloudex.upload(file.path, %{ public_id: filename })
  end

  def delete(definition, version, {file, scope}) do
    Cloudex.delete(file)
  end

  def url(definition, version, {file, scope}, options \\ []) do
    protocol = case options do
      [protocol: protocol] -> protocol
      _ -> "http"
    end 
    protocol<>":"<>Cloudex.Url.for(file.file_name, version)
  end

end