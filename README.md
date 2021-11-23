# Arc Cloudinary

Arc Cloudinary provides an [`Arc`](https://github.com/stavro/arc) storage back-end for [`Cloudinary`](https://cloudinary.com/) through [`Cloudex`](https://github.com/smeevil/cloudex).

> **WARNING**: This is a development version: It contains the latest changes.

## Installation

Add the latest stable release to your `mix.exs` file:

```elixir
defp deps do
  [
    arc_cloudinary: "~> 0.1.0"
  ]
end
```

Then run `mix deps.get` in your shell to fetch the dependencies.

### Configuration

To store your attachments in `Cloudinary Cloud Files`, you'll need to provide a bucket destination in your application config:

```elixir
config :arc,
  storage: Arc.Storage.Cloudinary,
  cloudinary_cloud_name: 'my-api-key',
  cloudinary_api_key: 'my-secret',
  cloudinary_secret: 'my-cloud-name'
```

Connection to Cloudinary API's will through Cloudex Lib.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License and Author

Author: 2021 Helder de Sousa

This project is licensed under the MIT license, a copy of which can be found in the LICENSE file.