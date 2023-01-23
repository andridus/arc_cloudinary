defmodule Arc.Storage.Cloudinary do

  alias Arc.Cloudex

  def put(definition, version, {file, scope}) do
    _destination_dir = definition.storage_dir(version, {file, scope})
    filename = Path.basename(file.file_name, Path.extname(file.file_name))
    Arc.Cloudex.upload(file.path, %{ public_id: filename })
  end

  def delete(_definition, _version, {file, scope}) do
    filename = Path.basename(file.file_name, Path.extname(file.file_name))
    Arc.Cloudex.delete(filename)
  end

  def url(_definition, version, {file, _scope}, options \\ []) do
    protocol = case options do
      [protocol: protocol] -> protocol
      _ -> "http"
    end
    protocol<>":"<>Arc.Cloudex.Url.for(file.file_name, version)
  end

end
