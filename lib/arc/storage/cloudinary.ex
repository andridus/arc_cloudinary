defmodule Arc.Storage.Cloudinary do
  
  def put(definition, version, {file, scope}) do
    version
    destination_dir = definition.storage_dir(version, {file, scope})
    full_path = Path.join(destination_dir, file.file_name)

    Cloudex.upload(file.path, %{ public_id: file.file_name })

  end

  def delete(definition, version, {file, scope}) do
    Cloudex.delete(file)
  end

  def url(definition, version, {file, scope}, options \\ []) do
    Cloudex.Url.for(file.file_name, version)
  end

end