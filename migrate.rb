
require 'jekyll-import'

JekyllImport::Importers::RSS.run(
{
  'source' => 'http://simon.ispy.se/blog/feed/'
}
)

# JekyllImport::Importers::WordPress.run({
#   "dbname"                => "simon0000",
#   "user"                  => "simon0000",
#   "password"              => "emz4rL20MTKlVB9e8OY8",
#   "host"                  => "mysql1.sterik.lan",
#   "socket"                => "",
#   "table_prefix"          => "wp_",
#   "clean_entities"        => true,
#   "comments"              => true,
#   "categories"            => true,
#   "tags"                  => true,
#   "more_excerpt"          => true,
#   "more_anchor"           => true,
#   "status"                => ["publish"]
#   })
